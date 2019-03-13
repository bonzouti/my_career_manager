class ApplicationsController < ApplicationController
  before_action :authenticate_user!

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
    @application = Application.find(params[:id])

  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(company_name: params[:company_name], position: params[:position], status: params[:status], joboffer_link: params[:joboffer_link], joboffer_description: params[:joboffer_description])
    @application.user = User.all.sample
    if @application.save
      redirect_to root_path
    else
      render :new
    end
  end

  
end
