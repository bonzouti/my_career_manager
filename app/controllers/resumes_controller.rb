class ResumesController < ApplicationController

  def create
    @user = User.find(params[:user_id])

    if params[:resume] != nil 

    	@user.resume.attach(params[:resume])
	    flash[:success] = "Great ! Your resume has been uploaded"
	    redirect_to(user_path(@user))

	else

		flash[:error] = "Your resume couldn't been upload. Are you sure your file was uploaded ?"
		redirect_to(user_path(@user))


	end

  end

end
