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


end
