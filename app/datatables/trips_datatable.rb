class TripsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Trip.count,
        iTotalDisplayRecords: trips.total_entries,
        aaData: data
    }
  end

  private

  def data
    trips.map do |trip|
      [
          trip.drivership.car.plate,
          trip.drivership.driver.name,
          trip.workerlist.join('，'),
          trip.destination.name,
          trip.departure_time,
          trip.back_time,
          trip.note.name
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

      trips1 =trips.includes(:workers).where("users.name like :search", search: "%#{params[:sSearch]}%")

      trips2 = trips.includes(:destination, :note, :drivership).includes(:car, :driver).where("
            departure_time like :search or
            back_time like :search or
            notes.name like :search or
            destinations.name like :search or
            cars.plate like :search or
            users.name like :search", search: "%#{params[:sSearch]}%")
       trips = trips1 + trips2

    end

    trips
  end

  def fetch_trips_helper(sort_column, sort_direction)

    #默认按归来时间排序
    trips = Trip.order("back_time desc")

    case sort_column

      when "departure_time", "back_time"
        trips = Trip.order("#{sort_column} #{sort_direction}")
      when "note", "destination"
        trips = Trip.joins("LEFT OUTER JOIN #{sort_column}s ON #{sort_column}s.id =
                trips.#{sort_column}_id").order("#{sort_column}s.name #{sort_direction}")
      when "plate"
        trips = Trip.joins("LEFT OUTER JOIN driverships ON driverships.id=
                trips.drivership_id").joins("LEFT OUTER JOIN cars ON cars.id=
                driverships.car_id").order("cars.plate #{sort_direction}")
      when "driver"
        trips = Trip.joins("LEFT OUTER JOIN driverships ON driverships.id=
                trips.drivership_id").joins("LEFT OUTER JOIN users ON users.id=
                driverships.driver_id").order("users.name #{sort_direction}")

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