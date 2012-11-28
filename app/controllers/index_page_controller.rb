class IndexPageController < ApplicationController

  def index

    redirect_to current_user if signed_in?

    cars = Car.all

    @available_cars = []
    @cars_in_use = []
    cars.each { |car|
      #该车已出差
      if car.current_trip > 0
        @trip = Trip.find(car.current_trip)
        workerships = Workership.find_all_by_trip_id(@trip.id)
        workers_names = []
        workerships.each { |workership| workers_names << Worker.find(workership.worker_id).name } if !workerships.nil?

        @cars_in_use << {
            car: car,
            driver: @trip.drivership.driver,
            destination: @trip.destination.name,
            departure_time: @trip.departure_time,
            back_time: @trip.back_time,
            note: @trip.note.name,
            workers_names: workers_names
        }
      else
        #该车最近一次由谁驾驶？
        drivership = Drivership.where("car_id=?", car.id).order('created_at desc').first
        if drivership.nil?
          @available_cars << {
              car: car,
              driver: nil
          }
        else
          @available_cars << {
              car: car,
              driver: Driver.find(drivership.driver_id)
          }
        end
      end
    }

  end

end
