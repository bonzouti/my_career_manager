class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_match, only: [:show] 
  before_action :guest_match, only: [:guest_access]
  

  def index
    
    @next_steps = Step.where(status: "false").where('date > ?', Date.today).joins(:application).merge(Application.where(user_id: current_user.id))
    @identified = Application.where(user_id: current_user.id, status: "identified").order(:position)
    @applied = Application.where(user_id: current_user.id, status: "applied").order(:position)
    @in_progress = Application.where(user_id: current_user.id, status: "in_progress").order(:position)
  end


  def show
    @application = Application.find(params[:id])
    @next_steps = Step.where(status: "false", application: @application.id).order("date")
    @steps_done = Step.where(status: "true", application: @application.id).order("date")
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
      jobtitle: params[:jobtitle], status: params[:status], 
      joboffer_link: params[:joboffer_link], joboffer_description: params[:joboffer_description])
    @application.user = current_user
    if @application.save
      flash[:success] = "Your application for the position '#{@application.jobtitle}' has been created"
      redirect_to application_path(@application)
    else
      render :new
    end
  end


  def archive
    @application = Application.find(params[:id])
      @application.status = "archived"
      if @application.save
        flash[:alert] = "The application for the position '#{@application.jobtitle}' has been archived"
        redirect_to root_path
      end
  end
  
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    if current_user.is_admin != true
      redirect_to archived_index_path
    else
      redirect_to admin_root_path
    end
  end

  def user_match
    @application = Application.find(params[:id])
    if @application.user != current_user
      redirect_to root_path
    end
  end

  def sort_identified
    params[:application].each_with_index do |id, index|
      Application.where(id: id).update_all(position: index + 1, status: "identified")
    end
    head :ok
  end 

  def sort_applied
    params[:application].each_with_index do |id, index|
      Application.where(id: id).update_all(position: index + 1, status: "applied")
    end
    head :ok
  end 

  def sort_in_progress
    params[:application].each_with_index do |id, index|
      Application.where(id: id).update_all(position: index + 1, status: "in_progress")
    end
    head :ok
  end 

  def guest_access
    @application = Application.find(params[:id])
    @next_steps = Step.where(status: "false", application: @application.id).order("date")
    @steps_done = Step.where(status: "true", application: @application.id).order("date")
    @step = Step.new
  end

  private

  def guest_match
    @application = Application.find(params[:id])
    host = @application.user 

    if Invitation.where(guest_id: current_user.id, host_id: host.id).count == 0
      redirect_to root_path
    end
  end

end
