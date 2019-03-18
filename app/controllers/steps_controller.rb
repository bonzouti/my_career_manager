class StepsController < ApplicationController

    def new
        @step = Step.new
        @application=Application.find(params[:application_id])
    end 


    def create

    @step = Step.new(date: params[:date], category: params[:category], title: params[:title],
     description: params[:description])

    @application = Application.find(params[:application_id])
    @step.application = @application

        if @step.save
          @application.update_status
          redirect_to application_path(@application)
        else
          render :new
        end

    end

    def update

        @application = Application.find(params[:application_id])
        @step = Step.find(params[:id])
        @step.status = true

        if @step.save 

            @current_notes = @application.notes
            @addition_to_current_notes = "#{@step.date} : #{@step.category}"  

            @application.notes = @current_notes + "\n\n" + @addition_to_current_notes
            @application.save
            @step.destroy

            respond_to do |format|
                format.html {redirect_to application_path(@application)}
                format.js
            end


        end
 
    end 


end
