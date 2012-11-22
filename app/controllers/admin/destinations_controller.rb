module Admin
  class DestinationsController < BaseController
    # GET /destinations
    # GET /destinations.json
    def index
      @destinations = Destination.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @destinations }
      end

    end
  end
end
