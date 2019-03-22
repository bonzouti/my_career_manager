class UsersController < ApplicationController
  before_action :user_match, only: [:show] 


  def show
    @user = User.find(params[:id])  
    @archived = Application.where(status: "archived", user_id: current_user.id)
    @unarchived_applications = Application.where('status <> ?', "archived").where(user_id: current_user.id)
    @steps = Step.all
    @invitations_as_guest = Invitation.where(guest_id: current_user.id)
    @invitations_as_host = Invitation.where(host_id: current_user.id)
  end

  def archive
    @application = Application.find(params[:id])
    @application.status = "archived"
    if @application.save
        redirect_to root_path
    end
  end

  def user_match
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

end
