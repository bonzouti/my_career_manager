class ContactsController < ApplicationController
	include ApplicationHelper
	before_action :get_application

  def index
  	@contacts = @application.contacts
  end


  def create
  	@contact = Contact.new(application: @application, first_name: params[:first_name], last_name: params[:last_name],
     position: params[:position], email: params[:email], phone: params[:phone])
  		puts "c'est pas save"
  		pp @contact
		if @contact.save
			puts "ça a été save"
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

		respond_to do |format|
			format.html {redirect_to application_path(@application)}
			format.js
		end

=begin
		if mobile_device?
			flash[:alert] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"
			redirect_to application_contacts_path(@application)
		else
			flash[:alert] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"
			redirect_to application_path(@application)
		end 
=end
  end

  def destroy
  	@contact = Contact.find(params[:id])
  	@contact.destroy
		if mobile_device?
			flash[:error] = "Your contact #{@contact.first_name} #{@contact.last_name} has been deleted"
			redirect_to application_contacts_path(@application)
		else
			flash[:error] = "Your contact #{@contact.first_name} #{@contact.last_name} has been deleted"
			redirect_to application_path(@application)
		end
  end

  def create_modal

  	@contact = Contact.find(params[:id])

	respond_to do |format|
		format.html {redirect_to application_path(@application)}
		format.js
	end  	

  end

  private 

  def get_application

  	@application = Application.find(params[:application_id])

  end

end
