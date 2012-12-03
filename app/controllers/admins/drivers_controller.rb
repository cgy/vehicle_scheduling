module Admins
  class DriversController < BaseController
    # GET /drivers
    # GET /drivers.json
    def index

      @drivers = Driver.all

      respond_to do |format|
        format.html
        format.json { render json: DriversData.new(view_context) }
      end

    end
  end
end
