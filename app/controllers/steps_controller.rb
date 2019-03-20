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
          respond_to do |format|
            format.html {redirect_to application_path(@application)}
            format.js
          end
        else
          render :new
        end

    end

    def update
    @step = Step.find(params[:id])
    @application = Application.find(params[:application_id])

    @step.update(title: params[:title], category: params[:category], description: params[:description], date: params[:date])
    respond_to do |format|
        format.html {redirect_to application_path(@application)}
        format.js
    end


    end


    def validate

        @application = Application.find(params[:application_id])
        @step = Step.find(params[:id])
        @step.status = true

        if @step.save 

            @current_notes = @application.notes
            @addition_to_current_notes = "#{@step.date} : #{@step.category}"  

            if @current_notes == nil
                @application.notes = @addition_to_current_notes
            else
                @application.notes = @current_notes + "\n\n" + @addition_to_current_notes
            end
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
        respond_to do |format|
            format.html {redirect_to application_path(@application)}
            format.js
        end

    end


end
