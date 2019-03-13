class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all

  	@application = Application.find(params[:application_id])

  end
end
