module Admins
  class TripsController < BaseController
    # GET /trips
    # GET /trips.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: TripsDatatable.new(view_context) }
      end
    end

    # GET /trips/1/edit
    def edit
      @trip = Trip.find(params[:id])
      @cars = Car.order("model").all
      @drivers = Driver.order("group_id").all
      if @trip.ing
        @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
        @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
      end
      @drivership = @trip.drivership
      @selected_key = @trip.workers_ids.split(",")
    end

    # PUT /trips/1
    # PUT /trips/1.json
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

      #出差人员改动
      if params[:workers_ids_] and params[:workers_ids_].size
        #修改出差人员
        origin_workers_ids = @trip.workers_ids.split(',')
        workers_ids_ = params[:workers_ids_]
        @trip.workers_ids = workers_ids_.join(',')
        #删除被删除的工作人员
        origin_workers_ids.each { |owi|
          if workers_ids_.index(owi).nil?
            worker = Worker.find(owi)
            worker.update_attribute(:current_trip, 0) if @trip.ing
            @trip.workers.delete(worker)
          else
            workers_ids_.delete(owi)
          end
        }
        #增加被添加的工作人员
        workers_ids_.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
          worker.update_attribute(:current_trip, @trip.id) if @trip.ing
        }
      end

      #其它改动
      @trip.destination_id = params[:destination_id]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.workers_names = @trip.generate_workers_names


      respond_to do |format|
        format.html do
          if @trip.save
            flash[:success] = "修改已保存！"
            redirect_to edit_admins_trip_path(@trip)
          else
            @cars = Car.order("model").all
            @drivers = Driver.order("group_id").all
            if @trip.ing
              @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
              @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
            end
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",")
            render 'edit'
          end
        end
        format.js
      end
    end

    # DELETE /trips/1
    # DELETE /trips/1.json
    def destroy
      @trip = Trip.find(params[:id])

      if @trip.ing
        @trip.driver.update_attribute(:current_trip, 0)
        @trip.car.update_attribute(:current_trip, 0)
        @trip.workers.each do |worker|
          worker.update_attribute(:current_trip, 0)
        end
      end

      @trip.workers.clear

      @trip.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该出差记录已删除！"
          redirect_to admins_trips_path
        end
        format.json
      end
    end


  end
end
