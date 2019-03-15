class ContactsController < ApplicationController
  def index

  	@application = Application.find(params[:application_id])

  	 @contacts = @application.contacts


  end

  def create

  	@application = Application.find(params[:application_id])

  	@contact = Contact.new(application: @application, first_name: params[:first_name], last_name: params[:last_name],
     position: params[:position], email: params[:email], phone: params[:phone])

  	if @contact.save

      flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been created"
  		redirect_to application_contacts_path(@application)

  	end


  end


  def update

  	@contact = Contact.find(params[:id])

  	@contact.update(first_name: params[:first_name], last_name: params[:last_name], position: params[:position],
     email: params[:email], phone: params[:phone])

    flash[:success] = "Your contact #{@contact.first_name} #{@contact.last_name} has been updated"

  	redirect_to application_contacts_path

  end

  def destroy

  	@contact = Contact.find(params[:id])

  	puts @contact.first_name
  	puts "$" * 60
  	puts params
  	@contact.destroy

    flash[:error] = "Your contact #{@contact.first_name} #{@contact.last_name} has been deleted"
  	redirect_to application_contacts_path

  end


end
