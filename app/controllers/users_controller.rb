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


end
