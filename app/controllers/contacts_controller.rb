class ContactsController < ApplicationController
  def index

  	@application = Application.find(params[:application_id])

  	 @contacts = @application.contacts


  end
end
