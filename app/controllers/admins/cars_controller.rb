module Admins
  class CarsController < BaseController
    # GET /cars
    # GET /cars.json
    def index
      @car = Car.new
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
          redirect_to admins_cars_path
        else
          render 'new'
        end
      end
    end


  end
end
