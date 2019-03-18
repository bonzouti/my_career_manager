class Admin::UsersController < ApplicationController
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
end
