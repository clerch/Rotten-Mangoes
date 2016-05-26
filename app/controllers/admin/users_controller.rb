class Admin::UsersController < ApplicationController

  before_action :restrict_admin_access

  def index
    @users = User.all.order(:firstname).page params[:page]
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else 
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(
    :firstname, :lastname, :email, :admin
  )
  end

end
