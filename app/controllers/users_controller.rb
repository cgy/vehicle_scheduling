#encoding: utf-8
class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "您的资料已更新"
      sign_in @user
      redirect_to user_root
    else
      render 'edit'
    end
  end

  private
  def current_resource
    @current_resource ||= User.find(params[:id]) if params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :phone, :group_id, :password, :password_confirmation, :remember_token, :current_trip)
  end
end
