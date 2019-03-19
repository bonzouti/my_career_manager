class StepsController < ApplicationController

    def new
        @step = Step.new
        @application=Application.find(params[:application_id])
    end 


    def create

    @step = Step.new(date: params[:date], category: params[:category], title: params[:title],
     description: params[:description], status: false)

    @application = Application.find(params[:application_id])
    @step.application = @application

        if @step.save
          @application.update_status
          flash[:success] = "Your step has been created"
          redirect_to application_path(@application)
        else
          render :new
        end

    end

    def update

    @step = Step.find(params[:id])
    @application = Application.find(params[:application_id])

    @step.update(title: params[:title], category: params[:category], description: params[:description],
     date: params[:date])

    flash[:success] = "The step has been updated"

    redirect_to application_path(@application)


    end


    def validate

        @application = Application.find(params[:application_id])
        @step = Step.find(params[:id])
        @step.status = true

        if @step.save 

            @current_notes = @application.notes
            @addition_to_current_notes = "#{@step.date} : #{@step.category}"  

            @application.notes = @current_notes + "\n\n" + @addition_to_current_notes
            @application.save
            respond_to do |format|
                format.html {redirect_to application_path(@application)}
                format.js
            end


        end
 
    end 


    def destroy

        @application = Application.find(params[:application_id])
        @step = Step.find(params[:id])

        @step.destroy

        redirect_to application_path(@application)

    end


end
