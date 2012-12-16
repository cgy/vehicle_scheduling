module Drivers
  class TripsController < BaseController

    def index
      @trip = Trip.new
    end

    # GET /trips/new
    # GET /trips/new.json
    def new

      @trip = Trip.new


      @cars = Car.where("current_trip = ?", 0).order("model").all
      @drivership = @trip.drivership

      @selected_key = ""



      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @trip }
      end

    end


    def create

      @trip = Trip.new

      driver = current_user

      if params[:car_id] and params[:car_id].size

        drivership = Drivership.where(:car_id => params[:car_id],
                                    :driver_id => driver.id).first_or_create
        @trip.drivership_id = drivership.id

      end

      @selected_key = ""

      if params[:workers_ids_] and params[:workers_ids_].size
        workers_ids_ = params[:workers_ids_]
        @trip.workers_ids = workers_ids_.join(',')
        workers_ids_.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
        }

        @selected_key = @trip.workers_ids.split(",")

      end

      @trip.destination_id = params[:destination_id]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.workers_names = @trip.generate_workers_names

      respond_to do |format|
        format.html do
          if @trip.save

            @trip.car.update_attribute(:current_trip, @trip.id)
            driver.update_attribute(:current_trip, @trip.id)
            @trip.workers.each { |worker|
              worker.update_attribute(:current_trip, @trip.id)
            }

            flash[:success] = "出差记录已添加！"
            redirect_to '/drivers/tour'
          else

            @cars = Car.where("current_trip = ?", 0).order("model").all
            @drivership = @trip.drivership

            render 'new'

          end
        end
        format.js
      end


    end

  end

end
