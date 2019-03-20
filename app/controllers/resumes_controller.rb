class ResumesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @user.resume.attach(params[:resume])
    flash[:success] = "Great ! Your resume has been uploaded"
    redirect_to(user_path(@user))
  end

end
