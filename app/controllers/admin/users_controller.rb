class Admin::UsersController < ApplicationController

before_action :restrict_admin_access

  def index
    @user = User.all
  end



# index 
# show 
# edit 
# update






end
