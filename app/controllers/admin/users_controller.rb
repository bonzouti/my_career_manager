class Admin::UsersController < ApplicationController
  before_action :is_admin

  def show
    @user = User.find(params[:id])
    @applications = @user.applications.sort_by &:updated_at
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_root_path
    end
  end 

  def is_admin

		if current_user.is_admin != true
			redirect_to root_path
    end
  end

end
