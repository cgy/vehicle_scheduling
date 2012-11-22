module Admin
  class CarsController < BaseController
    # GET /cars
    # GET /cars.json
    def index
      @cars = Car.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @cars }
      end
    end
  end
end
