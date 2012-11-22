module Admin
  class DriversController < BaseController
    # GET /drivers
    # GET /drivers.json
    def index
      @drivers = Driver.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @drivers }
      end

    end
  end
end
