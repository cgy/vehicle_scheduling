module Workers
  class BaseController < ApplicationController
    def user_in_trip
      flash[:success] = "您的状态已被司机或管理员修改！"
      redirect_to(user_root) unless in_trip?(current_user)
    end
  end
end
