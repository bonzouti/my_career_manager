class UserMailer < ApplicationMailer
    default from: 'no-reply@mycareermanager.com'
 
  def welcome_email(user)
    @user = user 

    @url  = 'http://mycareermanager.herokuapp.com/users/sign_up' 

    mail(to: @user.email, subject: 'My Career Manager vous souhaite la bienvenue !') 
  end
end
