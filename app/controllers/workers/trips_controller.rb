module Workers
  class TripsController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: WorkerTripsDatatable.new(view_context, current_user) }
      end
    end
  end
end
