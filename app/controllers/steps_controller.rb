class StepsController < ApplicationController
    def new
        @step = Step.new
        @application=Application.find(params[:application_id])
    end 

    def create
        @step = Step.new(date: params[:date], category: params[:category], title: params[:title], description: params[:description])
        @application = Application.find(params[:application_id])
        @step.application = @application
    if @step.save
      redirect_to application_path(@application)
    else
      render :new
    end
    end 
end
