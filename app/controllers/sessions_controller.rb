class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      if current_user.admin?
        redirect_back_or admin_trips_path
      elsif driver_user?(current_user)
        redirect_back_or driver_trip_path
      else
        redirect_back_or worker_trip_path
      end
    else
      flash.now[:error] = '*用户名或密码错误!'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
