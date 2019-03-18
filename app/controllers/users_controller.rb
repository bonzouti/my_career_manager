class UsersController < ApplicationController
  def show
        
    @applications = current_user.applications
    @archived = []
    
    @applications.each do |application|
      if application.status == "archived"
        @archived << application
      end
    end
  end

  def archive
    @application = Application.find(params[:id])
    @application.status = "archived"
    if @application.save
        redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_path
    end
  end 


end
