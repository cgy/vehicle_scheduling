class StaticPagesController < ApplicationController
  def home

    redirect_to user_path if signed_in?

    cars = Car.all

    @car_status = []
    cars.each { |car|
      if car.current_trip > 0
        @trip = Trip.find(car.current_trip)
        @car_status << {
          model:          car.model,
          plate:          car.plate,
          driver:         @trip.user.name,
          destination:    @trip.destination.name,
          departure_time: @trip.departure_time,
          back_time:      @trip.back_time,
          note:           @trip.note,
          available:      false
        }
      else
        @car_status << {
          model:          car.model,
          plate:          car.plate,
          driver:         @trip.user.name,
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
