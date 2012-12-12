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

    def new
      @car = Car.new
    end

    def create

      @car = Car.create!(params[:car])

      respond_to do |format|
        format.html { redirect_to admins_cars_path }
        format.js
      end

    end


  end
end
