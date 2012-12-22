class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  include TripsHelper

  before_filter :authorize

private

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

  def authorize
    if !current_permission.allow?(params[:controller], params[:action], current_resource)
      flash[:error] = "您没有该链接的访问权限！"
      redirect_to user_root
    end
  end

end
