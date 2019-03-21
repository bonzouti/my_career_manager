class Admin::DashboardsController < ApplicationController
  before_action :is_admin

  def index
  end 

  def is_admin

		if current_user.is_admin != true
			redirect_to root_path

    end
  end

end
