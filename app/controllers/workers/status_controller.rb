module Workers
  class StatusController < BaseController

    def start
      redirect_to '/workers/tour' if current_user.current_trip > 0
    end

    def tour

      redirect_to '/workers/start' unless current_user.current_trip > 0

      @trip = Trip.find(current_user.current_trip)

      @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
      @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
      @drivership = @trip.drivership
      @selected_key = @trip.workers_ids.split(",")

    end

    # PUT /trips/1
    # PUT /trips/1.json
    def update

      @trip = Trip.find(current_user.current_trip)
      car = @trip.car
      driver = @trip.driver

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
            worker.update_attribute(:current_trip, 0)
            @trip.workers.delete(worker)
          else
            workers_ids_.delete(owi)
          end
        }
        #增加被添加的工作人员
        workers_ids_.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
          worker.update_attribute(:current_trip, @trip.id)
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
            #submit为保存修改
            flash[:success] = "修改已保存！"
            sign_in(current_user)
            redirect_to '/workers/tour'
          else
            @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
            @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",")
            sign_in(current_user)
            render '/workers/status/tour'
          end
        end
        format.js
      end
    end

  end

end
