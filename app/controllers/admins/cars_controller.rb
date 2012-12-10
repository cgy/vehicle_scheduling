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

      @car = Car.new(params[:car])

      respond_to do |format|
        if @car.save
          format.html { redirect_to @car, notice: '车辆已新增' }
          format.js
        else
          format.html { render action: "new" }
          format.js { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    end


  end
end
