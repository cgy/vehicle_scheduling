module Admins
  class DriversHistoryController < BaseController
    # GET /drivers_history
    # GET /drivers_history.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: DriversHistoryDatatable.new(view_context) }
      end
    end

    # GET /drivers_history/1/edit
    def edit
      @trip = Trip.find(params[:id])
      @cars = Car.order("model").all
      @drivers = Driver.order("group_id").all
      if @trip.ing
        @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
        @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
      end
      @drivership = @trip.drivership
    end

    # PUT /drivers_history/1
    # PUT /drivers_history/1.json
    def update

      @trip = Trip.find(params[:id])
      car = @trip.car
      driver = @trip.driver

      #车辆或司机被改动
      unless params[:car_id] == car.id.to_s and params[:driver_id] == driver.id.to_s
        if params[:car_id] == "" or params[:driver_id] == ""
          @trip.drivership_id = ""
        else
          #drivership是否存在 不存在就创建
          drivership = Drivership.where(:car_id => params[:car_id],
                                        :driver_id => params[:driver_id]).first_or_create
          @trip.drivership_id = drivership.id
          ##如果该出差还没结束 更新车辆和司机的出差状态
          if @trip.ing
            if params[:car_id] != car.id.to_s
              new_car = Car.find(params[:car_id])
              new_car.update_attribute(:current_trip, @trip.id)
              car.update_attribute(:current_trip, 0)
            end
            if params[:driver_id] != driver.id.to_s
              new_driver = Driver.find(params[:driver_id])
              new_driver.update_attribute(:current_trip, @trip.id)
              driver.update_attribute(:current_trip, 0)
            end
          end
        end
      end

      #其它改动
      @trip.destination_id = params[:destination_id]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]


      respond_to do |format|
        format.html do
          if @trip.save
            flash[:success] = "修改已保存！"
            redirect_to '/admins/drivers-history/'+@trip.id.to_s+'/edit'
          else
            @cars = Car.order("model").all
            @drivers = Driver.order("group_id").all
            if @trip.ing
              @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
              @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
            end
            @drivership = @trip.drivership
            render 'edit'
          end
        end
        format.js
      end
    end

    # DELETE /drivers_history/1
    # DELETE /drivers_history/1.json
    def destroy

      @trip = Trip.find(params[:id])

      @trip.workers.clear

      @trip.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该出差记录已删除！"
          redirect_to admins_drivers_history_path
        end
        format.json
      end

    end

  end
end
