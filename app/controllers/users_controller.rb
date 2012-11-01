class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :index, :new, :create, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:new, :create, :destroy, :index]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "用户已创建"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "资料已更新"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end

  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy

    @user = User.find(params[:id])

    #不允许管理员删除自己
    redirect_to(root_path) if current_user?(@user)

    @user.destroy
    flash[:success] = "用户已删除."
    redirect_to users_url
  end

end
