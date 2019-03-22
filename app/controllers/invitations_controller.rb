class InvitationsController < ApplicationController
  before_action :guest_match, only: [:show] 
  before_action :host_match, only: [:destroy] 

  def new
    @invitation = Invitation.new
  end

  def create
    if User.find_by(email: params[:email]) != nil

      @guest = User.find_by(email: params[:email])
      @invitation = Invitation.new(guest_id: @guest.id, host_id: current_user.id)
 
      if @invitation.save
        flash[:success] = "Sent"
        redirect_to user_path(current_user)
      else
        flash[:error] = "Invitation could not be sent."
        render :new
      end
    else 
      flash[:error] = "Invitation could not be sent."
      render :new
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
    @user = @invitation.host
    @next_steps = Step.where(status: "false").where('date > ?', Date.today).joins(:application).merge(Application.where(user_id: @user.id))
    @identified = Application.where(user_id: @user.id, status: "identified").order(:position)
    @applied = Application.where(user_id: @user.id, status: "applied").order(:position)
    @in_progress = Application.where(user_id: @user.id, status: "in_progress").order(:position)
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to user_path(current_user)
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
