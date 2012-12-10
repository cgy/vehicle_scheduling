module Admins
  class CarsController < BaseController
    # GET /cars
    # GET /cars.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: CarsDatatable.new(view_context) }
      end
    end
  end
end
