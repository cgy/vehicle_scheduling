class StaticPagesController < ApplicationController
  def home

    redirect_to user_path if signed_in?

    car_drivers = CarDriver.all

    @car_status = []
    car_drivers.each { |car_driver|
      if car_driver.current_trip > 0
        @trip = Trip.find(car_driver.current_trip)
        @car_status << {
          model:          car_driver.car.model,
          plate:          car_driver.car.plate,
          driver:         User.find(car_driver.driver_id).name,
          destination:    @trip.destination.name,
          departure_time: @trip.departure_time,
          back_time:      @trip.back_time,
          note:           @trip.note,
          available:      false
        }
      else
        @car_status << {
          model:          car_driver.car.model,
          plate:          car_driver.car.plate,
          driver:         User.find(car_driver.driver_id).name,
          destination:    "",
          departure_time: "",
          back_time:      "",
          note:           "",
          available:      true
        }
      end }
    @car_status.sort!{ |a, b| a[:destination] <=> b[:destination] }
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
