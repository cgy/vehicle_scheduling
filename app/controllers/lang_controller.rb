


class LangController < BaseController
  # GET /trips
  # GET /trips.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: TripsDatatable.new(view_context) }
    end
  end
end
