class ApplicationsController < ApplicationController
  def index
    @applications = Application.all

    @identified = []
    @applications.each do |application|
      if application.status == "identified"
        @identified << application
      end
    end

    @applied = []
    @applications.each do |application|
      if application.status == "applied"
        @applied << application
      end
    end

    @in_progress = []
    @applications.each do |application|
      if application.status == "identified"
        @in_progress << application
      end
    end

  end

  def show

  end

  def new

  end 

  
end
