class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @email = @user.user.email 
    mail(to: @email, subject: 'Welcome to Our App')
  end
end
