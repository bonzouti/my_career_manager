class ArchivedController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @archived = Application.where(status: "archived", user_id: current_user.id)
  end

  def new
  end

end

#OK