class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @applications = @user.applications.sort_by &:updated_at
  end
end
