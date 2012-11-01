class StaticPagesController < ApplicationController
  def home

    redirect_to current_user if signed_in?

    cars = Car.all
    users = User.all

    @available_cars = []
    @cars_in_use = []
    cars.each { |car|
      #该车已出差
      if car.current_trip > 0
        @trip = Trip.find(car.current_trip)
        trip_member = TripMember.find_all_by_trip_id(@trip.id)
        members = []
        trip_member.each { |tp| members << User.find(tp.member_id).name } if !trip_member.nil?

        @cars_in_use << {
          car:            car,
          driver:         @trip.user,
          destination:    @trip.destination,
          departure_time: @trip.departure_time,
          back_time:      @trip.back_time,
          note:           @trip.note,
          trip_members:   members
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
