class InvitationsController < ApplicationController
  before_action :guest_match, only: [:show] 
  before_action :host_match, only: [:destroy] 

  def show
    @invitation = Invitation.find(params[:id])
    @user = @invitation.host
    @next_steps = Step.where(status: "false").where('date > ?', Date.today).joins(:application).merge(Application.where(user_id: @user.id))
    @identified = Application.where(user_id: @user.id, status: "identified").order(:position)
    @applied = Application.where(user_id: @user.id, status: "applied").order(:position)
    @in_progress = Application.where(user_id: @user.id, status: "in_progress").order(:position)
  end

  private
  
  def guest_match
    @invitation = Invitation.find(params[:id])
    if @invitation.guest != current_user
      redirect_to root_path
    end
  end

  def host_match
    @invitation = Invitation.find(params[:id])
    if @invitation.host != current_user
      redirect_to root_path
    end
  end

end
