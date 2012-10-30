class StaticPagesController < ApplicationController
  def home

    redirect_to user_path if signed_in?

    cars = Car.all
    users = User.all

    @available_cars = []
    @cars_in_use = []
    cars.each { |car|
      if car.current_trip > 0
        @trip = Trip.find(car.current_trip)
        @cars_in_use << {
          car:            car,
          driver:         @trip.user,
          destination:    @trip.destination,
          departure_time: @trip.departure_time,
          back_time:      @trip.back_time,
          note:           @trip.note,
        }
      else
        #该车最近一次由谁驾驶？
        car_driver = CarDriver.where("car_id=?",car.id).order('created_at desc').first
        if car_driver.nil?
          @available_cars << {
              car: car,
              driver: nil
          }
        else
          @available_cars << {
            car: car,
            driver: User.find(car_driver.driver_id)
          }
        end
      end
    }

  end

  def help
  end

  def about
  end

  def contact
  end
end
