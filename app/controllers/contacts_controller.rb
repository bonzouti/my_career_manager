class ContactsController < ApplicationController
	include ApplicationHelper



  def index

  	@application = Application.find(params[:application_id])

  	@contacts = @application.contacts


  end


  def create

  	@application = Application.find(params[:application_id])

  	@contact = Contact.new(application: @application, first_name: params[:first_name], last_name: params[:last_name],
     position: params[:position], email: params[:email], phone: params[:phone])

		if @contact.save
			
			if mobile_device?
				flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been created"
				redirect_to application_contacts_path(@application)
			else
				respond_to do |format|
					format.html {redirect_to application_path(@application)}
					format.js
				end
				#flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been created"
				#redirect_to application_path(@application)
			end
			

		end
		
  end


  def update

  	@contact = Contact.find(params[:id])

  	@contact.update(first_name: params[:first_name], last_name: params[:last_name], position: params[:position],
     email: params[:email], phone: params[:phone])
		
		if mobile_device?
			flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"
			redirect_to application_contacts_path(@application)
		else

			flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"
			redirect_to application_path(@application)
		end 

  end

  def destroy

  	@contact = Contact.find(params[:id])

  	puts @contact.first_name
  	puts "$" * 60
  	puts params
  	@contact.destroy
		
		if mobile_device?
			flash[:error] = "Your contact #{@contact.first_name} #{@contact.last_name} has been deleted"
			redirect_to application_contacts_path(@application)
		else

			flash[:error] = "Your contact #{@contact.first_name} #{@contact.last_name} has been deleted"
			redirect_to application_path(@application)
		end 

  end


end
