class StaticPagesController < ApplicationController
  def home

    redirect_to user_path if signed_in?

    cars = Car.all
    users = User.all

    @available_users = []
    users.each { |user|
      if !user.admin? && user.current_trip == 0
        @available_users << user
      end
    }


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
        cd = CarDriver.where(car_id = car.id).order('created_at desc')
        @available_cars << car
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
