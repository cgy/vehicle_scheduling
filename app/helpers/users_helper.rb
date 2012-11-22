module UsersHelper
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def driver_user?(user)
    user.user_type == 1
  end


end
