module DriverController
  class TripController < BaseController
    def index
      @trip = Trip.new
    end
  end
end
