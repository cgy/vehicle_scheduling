module Drivers
  class StatusController < BaseController

    def start
      redirect_to '/drivers/tour' if current_user.current_trip > 0
    end

    def tour

      redirect_to '/drivers/start' unless current_user.current_trip > 0

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

      #车辆或司机被改动
      unless params[:car_id] == car.id.to_s

        if params[:car_id] == ""
          @trip.drivership_id = ""
        else
          #drivership是否存在 不存在就创建
          drivership = Drivership.where(:car_id => params[:car_id],
                                        :driver_id => driver.id).first_or_create
          @trip.drivership_id = drivership.id

          if params[:car_id] != car.id.to_s
            new_car = Car.find(params[:car_id])
            #冲突解决
            if new_car.current_trip > 0
              @trip.errors.add(:cars, "就在刚才，你选的车辆已被添加到新增出差记录（出差）了，概率很小哦~ 囧~~~ 选其它车吧。")
            else
              new_car.update_attribute(:current_trip, @trip.id)
              car.update_attribute(:current_trip, 0)
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
          #冲突解决
          if @trip.ing
            if worker.current_trip > 0
              @trip.workers.delete(worker)
              @trip.errors.add(:workers, "就在刚才，你选的工作人员被别人选了，概率很小哦~ 囧~~~ 选其它人吧。")
            else
              worker.update_attribute(:current_trip, @trip.id)
            end
          end
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
          if params[:workers_ids_] and params[:workers_ids_].size and @trip.errors.empty? and @trip.save
            #如果为出差结束 提交信息
            if params[:commit]
              @trip.ing = false
              @trip.car.update_attribute(:current_trip, 0)
              current_user.update_attribute(:current_trip, 0)
              @trip.workers.each { |worker|
                worker.update_attribute(:current_trip, 0)
              }
              @trip.save
              sign_in(current_user)
              redirect_to '/drivers/start'
            else
              #submit为保存修改
              flash[:success] = "修改已保存！"
              redirect_to '/drivers/tour'
            end
          else
            @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",")
            @trip.errors.add(:workers, "工作人员不能为空") unless params[:workers_ids_] and params[:workers_ids_].size

            render '/drivers/status/tour'
          end
        end
        format.js
      end
    end

  end

end
