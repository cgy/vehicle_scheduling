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

    def back



    end

  end

end
