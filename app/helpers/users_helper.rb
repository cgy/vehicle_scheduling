module UsersHelper

  def admin_user
    redirect_to(root_path) unless current_user.is_a? Admin
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
