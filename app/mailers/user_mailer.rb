class UserMailer < ApplicationMailer
    default from: 'no-reply@mycareermanager.com'
 
  def welcome_email(user)
    @user = user 

    @url  = 'http://mycareermanager.herokuapp.com/users/sign_up' 

    mail(to: @user.email, subject: 'Welcome to My Career Manager!') 
  end
end
