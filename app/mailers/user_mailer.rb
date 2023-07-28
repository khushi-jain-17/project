class UserMailer < ApplicationMailer

  def example(user)
    @user = user
    mail(to: @user.email, subject: 'Test Email for Letter Opener')
  end

end






# class UserMailer < ApplicationMailer
#   def welcome_email(user)
#     @user = user
#     mail(to: @user.email, subject: 'Welcome to Our Application')
#   end
# end

