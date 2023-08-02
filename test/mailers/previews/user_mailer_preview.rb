class UserMailerPreview < ActionMailer::Preview

  def example
    UserMailer.example(User.new(email: 'bo@samurails.com'))
  end

end


