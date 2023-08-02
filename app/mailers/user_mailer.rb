# frozen_string_literal: true

class UserMailer < ApplicationMailer

  def example(user)
    @user = user
<<<<<<< HEAD
    mail(to: @user.email, subject: 'Welcome to Our App')
=======
    mail(to: @user.email, subject: 'Test Email for Letter Opener')
>>>>>>> 55a66941968580ad870a4a7a556fdc3fd063f09e
  end

end






# class UserMailer < ApplicationMailer
#   def welcome_email(user)
#     @user = user
#     mail(to: @user.email, subject: 'Welcome to Our Application')
#   end
# end

