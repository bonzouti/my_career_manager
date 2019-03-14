class ArchivedController < ApplicationController

  def index
    @applications = current_user.applications
    @archived = []
    @applications.each do |application|
      if application.status == "archived"
        @archived << application
      else
      end
    end  
  end

  def new
  end

end

