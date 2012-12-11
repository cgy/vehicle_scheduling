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

      @car = Car.create!(model: params[:model],
                         plate: params[:plate],
                         load:  params[:load])
      respond_to do |format|
        if @car.save
          flash[:success] = "车辆已新增！"
          format.html
          format.json { render json: CarsDatatable.new(view_context) }
        else
          render "new"
        end
      end
    end


  end
end
