module Drivers
  class StatusController < BaseController

    def start
      redirect_to '/drivers/tour' if current_user.current_trip > 0
    end

    def tour
      redirect_to '/drivers/start' unless current_user.current_trip > 0
    end

  end

end
