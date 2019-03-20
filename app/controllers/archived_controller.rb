class ArchivedController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @archived = current_user.applications.to_a.select {|x| x.status == "archived"}.sort_by &:updated_at
  end

  def new
  end

end

