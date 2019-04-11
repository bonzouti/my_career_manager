class ContactsController < ApplicationController
	include ApplicationHelper
	before_action :get_application

  def index
  	@contacts = @application.contacts
  end


  def create
  	@contact = Contact.new(application: @application, first_name: params[:first_name], last_name: params[:last_name],
     position: params[:position], email: params[:email], phone: params[:phone])
		if @contact.save
			if mobile_device?
				flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been created"
				redirect_to application_contacts_path(@application)
			else
				respond_to do |format|

					format.html {
						flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been created"
						redirect_to application_path(@application)
					}
					format.js
				end

			end
		end
  end

  def update

  	@contact = Contact.find(params[:id])

  	@contact.first_name = params[:first_name]
  	@contact.last_name = params[:last_name]
  	@contact.position = params[:position]
  	@contact.email = params[:email]
  	@contact.phone = params[:phone]

  	if @contact.save

		respond_to do |format|

			format.html { 

			if mobile_device?
				flash[:alert] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"
				redirect_to application_contacts_path(@application)
			else
				flash[:alert] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"
				redirect_to application_path(@application)
			end 
			}

			format.js
		end

	else 

		flash[:danger] = "Your contact has not been updated"
		redirect_to application_path(@application)

	end


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
