class ApplicationsController < ApplicationController
  def index
    @applications = Application.all

    @identified = []
    @applied = []
    @in_progress = []
    @applications.each do |application|
      if application.status == "identified"
        @identified << application
      elsif application.status == "applied"
        @applied << application
      elsif application.status == "in_progress"
        @in_progress << application
      end
    end

  end

  def show

  end

  def new

  end 

  
end
