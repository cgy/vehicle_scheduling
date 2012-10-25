class StaticPagesController < ApplicationController
  def home
    @trip = Trip.all
    if !@trip.nil?
      @car = @trip.car
      @user = @trip.user
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
