class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
        
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


  def update_user_details
    @user = current_user

    if @user.update(country: params[:country], full_name: params[:full_name])
      redirect_to root_path
    else
      render :edit
    end
  end


end
