class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_match, only: [:show] 
  

  def index
    
    @next_steps = Step.where(status: "false").where('date > ?', Date.today).joins(:application).merge(Application.where(user_id: current_user.id))
    @identified = Application.where(user_id: current_user.id, status: "identified").order("updated_at")
    @applied = Application.where(user_id: current_user.id, status: "applied").order("updated_at")
    @in_progress = Application.where(user_id: current_user.id, status: "in_progress").order("updated_at")
  end


  def show
    @application = Application.find(params[:id])
    @next_steps = Step.where(status: "false", application: @application.id)
    @steps_done = Step.where(status: "true", application: @application.id)
    @step = Step.new
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

  def user_match
    @application = Application.find(params[:id])
    if @application.user != current_user
      redirect_to root_path
    end
  end

end
