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

    # GET /trips/1
    # GET /trips/1.json
    def show

      @trip = Trip.find(params[:id])


      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @trip }
      end
    end

    # GET /trips/new
    # GET /trips/new.json
    def new
      @trip = Trip.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @trip }
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

    # POST /trips
    # POST /trips.json
    def create
      @trip = Trip.new(params[:trip])

      respond_to do |format|
        if @trip.save
          format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
          format.json { render json: @trip, status: :created, location: @trip }
        else
          format.html { render action: "new" }
          format.json { render json: @trip.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /trips/1
    # PUT /trips/1.json
    def update


      @trip = Trip.find(params[:id])
      car = @trip.car
      driver = @trip.driver

      #车辆或司机被改动
      unless params[:car_id] == car.id and params[:driver_id] == driver.id
        #drivership是否存在 不存在就创建
        drivership = Drivership.where(:car_id => params[:car_id],
                                      :driver_id => params[:driver_id]).first_or_create
        @trip.drivership_id = drivership.id
        ##如果该出差还没结束 更新车辆和司机的出差状态
        if @trip.ing
          if params[:car_id] != car.id
            new_car = Car.find(params[:car_id])
            new_car.update_attribute(:current_trip, @trip.id)
            car.update_attribute(:current_trip, 0)
          end
          if params[:driver_id] != driver.id
            new_driver = Driver.find(params[:driver_id])
            new_driver.update_attribute(:current_trip, @trip.id)
            driver.update_attribute(:current_trip, 0)
          end
        end
      end


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
        worker = Worker.find(wi.to_i)
        @trip.workers << worker
        worker.update_attribute(:current_trip, @trip.id) if @trip.ing
      }

      @trip.destination_id = params[:destination_id]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.workers_names = @trip.generate_workers_names

      respond_to do |format|
        format.html do
          if @trip.save

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
      @trip.destroy

      respond_to do |format|
        format.html { redirect_to trips_url }
        format.json { head :no_content }
      end
    end
  end
end
