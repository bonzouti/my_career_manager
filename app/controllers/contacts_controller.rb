class ContactsController < ApplicationController
  def index

  	@application = Application.find(params[:application_id])

  	 @contacts = @application.contacts


  end

  def create

  	@application = Application.find(params[:application_id])

  	@contact = Contact.new(application: @application, first_name: params[:first_name], last_name: params[:last_name], position: params[:position], email: params[:email], phone: params[:phone])

  	if @contact.save

  		redirect_to application_contacts_path(@application)

  	end


  end


  def update

  	@contact = Contact.find(params[:id])

  	@contact.update(first_name: params[:first_name], last_name: params[:last_name], position: params[:position], email: params[:email], phone: params[:phone])

  	redirect_to application_contacts_path

  end

  def destroy

  	@contact = Contact.find(params[:id])

  	puts @contact.first_name
  	puts "$" * 60
  	puts params
  	@contact.destroy
  	redirect_to application_contacts_path

  end


end
