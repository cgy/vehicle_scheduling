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
    # Trip.find_by_sql("SELECT trips.*  FROM trips LEFT OUTER JOIN notes ON trips.note_id=notes.id order by notes.name asc")
    # trips = Trip.order("back_time desc")
    trips = fetch_trips_helper(sort_column, sort_direction)

    trips = trips.page(page).per_page(per_page)
    if params[:sSearch].present?
      trips = trips.where("departure_time like :search or back_time like :search", search: "%#{params[:sSearch]}%")
    end
    trips
  end

  def fetch_trips_helper(sort_column, sort_direction)
    trips = Trip.order("back_time desc")
    case sort_column
      when "departure_time", "back_time"
        trips = Trip.order("#{sort_column} #{sort_direction}")
      when "note", "destination"
        trips = Trip.find_by_sql("SELECT trips.*  FROM trips LEFT OUTER JOIN #{sort_column}s ON trips.#{sort_column}_id=#{sort_column}s.id order by #{sort_column}s.name #{sort_direction}")
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
    columns = %w[plate driver workers destinations departure_time back_time notes]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end