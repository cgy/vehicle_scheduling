module UsersHelper

  def admin_user
    redirect_to(root_path) unless current_user.is_a? Admin
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def user_root
    if current_user.is_a? Admin
      return '/admins/trips'
    elsif current_user.is_a? Driver
      return '/drivers/start'
    elsif current_user.is_a? Worker
      return '/workers/start'
    else
      return '/'
    end
  end

end
