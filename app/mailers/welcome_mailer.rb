class WelcomeMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://salty-garden-46479.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
 end
end
