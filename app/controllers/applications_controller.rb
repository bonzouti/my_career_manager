class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    
    @applications = current_user.applications
    @steps = current_user.steps

    @next_steps = current_user.steps.to_a.select {|x| x.date >= Date.today}.sort_by &:date

    @identified = current_user.applications.to_a.select {|x| x.status == "identified"}.sort_by &:updated_at
    @applied = current_user.applications.to_a.select {|x| x.status == "applied"}.sort_by &:updated_at
    @in_progress = current_user.applications.to_a.select {|x| x.status == "in_progress"}.sort_by &:updated_at


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


  def update_job_details
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

    @steps = @application.steps

    @next_steps = @application.steps.to_a.select {|x| x.date >= Date.today}.sort_by &:date


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
      flash[:success] = "Your application for the position '#{@application.position}' has been created"
      redirect_to application_path(@application)
    else
      render :new
    end
  end


  def archive
    @application = Application.find(params[:id])
      @application.status = "archived"
      if @application.save
        flash[:alert] = "The application for the position '#{@application.position}' has been archived"
        redirect_to root_path
      end
  end
  
  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    redirect_to archived_index_path
end

end
