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
    trips = Trip.order("back_time desc")
   # trips = Trip.order("#{sort_column} #{sort_direction}")
    trips = trips.page(page).per_page(per_page)
    if params[:sSearch].present?
      trips = trips.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w["车牌" "司机" "出差地" "出发时间" "（预计）归来时间" "事由"]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end