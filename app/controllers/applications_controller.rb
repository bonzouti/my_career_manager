class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    
    @applications = current_user.applications
    @steps = current_user.steps

    @next_steps = []
    @steps.each do |step|
      if step.date != nil
        if step.date > Date.today
          @next_steps << step
        end
      end
    end 

    @next_steps = @next_steps.sort_by &:date

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
  

  def update_notes
    @application = Application.find(params[:id])

    if @application.update(notes: params[:notes])
      respond_to do |format|
        format.html {redirect_to application_path(@application)}
        format.js
      end
    else
      render :edit
    end
  end


  def update_job_offer
    @application = Application.find(params[:id])

    if @application.update(joboffer_link: params[:joboffer_link], joboffer_description: params[:joboffer_description])
      respond_to do |format|
        format.html {redirect_to application_path(@application)}
        format.js
      end
    else
      render :edit
    end
  end


  def show
    @application = Application.find(params[:id])
  end


  def new
    @application = Application.new
  end


  def create
    @application = Application.new(company_name: params[:company_name], 
      position: params[:position], status: params[:status], 
      joboffer_link: params[:joboffer_link], joboffer_description: params[:joboffer_description])
    @application.user = current_user
    if @application.save
      redirect_to root_path
    else
      render :new
    end
  end

=begin
  def create_identified
    @application = Application.new(company_name: params[:company_name], 
    position: params[:position], status: "identified",
    joboffer_link: params[:joboffer_link], joboffer_description: params[:joboffer_description])
    @application.user = current_user
    if @application.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new_identified
    @application = Application.new
  end
=end


  def archive
    @application = Application.find(params[:id])
      @application.status = "archived"
      if @application.save
        redirect_to root_path
      end
  end
  
end
