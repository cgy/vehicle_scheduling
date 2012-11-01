class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = '用户名或密码错误'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
