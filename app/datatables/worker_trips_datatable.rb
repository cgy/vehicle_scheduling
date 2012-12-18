require 'date'
class WorkerTripsDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view, worker)
    @view = view
    @worker_id = worker.id
    @date_start = Date.today.at_beginning_of_year()
    @query = "worker_id = ? AND departure_time >= ?"
    @query1 = "worker_id = ?"
    @query2 = "departure_time >= ?"
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Trip.joins("LEFT OUTER JOIN workerships ON workerships.trip_id=
                trips.id").where(@query, @worker_id, @date_start).count,
        iTotalDisplayRecords: trips.total_entries,
        aaData: data
    }
  end

  private

  def data
    trips.map do |trip|
      [
          h(trip.drivership.car.plate),
          h(trip.drivership.driver.name),
          h(trip.workers_names),
          h(trip.destination.name),
          h(trip.departure_time),
          h(trip.back_time),
          h(trip.note.name),
          link_to('<i class="icon-edit"></i>'.html_safe, '/workers/trips/'+trip.id.to_s+'/edit')
      ]
    end
  end

  def trips
    @trips ||= fetch_trips
  end

  def fetch_trips

    trips = fetch_trips_helper(sort_column, sort_direction)
    trips = trips.page(page).per_page(per_page)

    if params[:sSearch].present?


      trips = trips.includes(:destination, :note, :drivership).includes(:car, :driver).where("
            departure_time like :search or
            back_time like :search or
            workers_names like :search or
            notes.name like :search or
            destinations.name like :search or
            cars.plate like :search or
            users.name like :search", search: "%#{params[:sSearch]}%")

    end

    trips
  end

  def fetch_trips_helper(sort_column, sort_direction)

    #默认按归来时间排序
    trips = Trip.joins("LEFT OUTER JOIN workerships ON workerships.trip_id=
                trips.id").where(@query, @worker_id, @date_start).order("back_time desc")

    case sort_column

      when "departure_time", "back_time"
        trips = Trip.joins("LEFT OUTER JOIN workerships ON workerships.trip_id=
                trips.id").where(@query, @worker_id, @date_start).order("#{sort_column} #{sort_direction}")
      when "note", "destination"
        trips = Trip.joins("LEFT OUTER JOIN workerships ON workerships.trip_id=
                trips.id").joins("LEFT OUTER JOIN #{sort_column}s ON #{sort_column}s.id =
                trips.#{sort_column}_id").where(@query, @worker_id, @date_start).order("#{sort_column}s.name #{sort_direction}")
      when "plate"
        trips = Trip.joins("LEFT OUTER JOIN workerships ON workerships.trip_id=
                trips.id").where(@query1, @worker_id).joins("LEFT OUTER JOIN driverships ON driverships.id=
                trips.drivership_id").joins("LEFT OUTER JOIN cars ON cars.id=
                driverships.car_id").where(@query2, @date_start).order("cars.plate #{sort_direction}")
      when "driver"
        trips = Trip.joins("LEFT OUTER JOIN workerships ON workerships.trip_id=
                trips.id").where(@query1, @worker_id).joins("LEFT OUTER JOIN driverships ON driverships.id=
                trips.drivership_id").joins("LEFT OUTER JOIN users ON users.id=
                driverships.driver_id").where(@query2, @date_start).order("users.name #{sort_direction}")

    end

    trips

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[plate driver workers destination departure_time back_time note]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
