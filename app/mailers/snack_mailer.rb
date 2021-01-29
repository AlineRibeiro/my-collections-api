class SnackMailer < ApplicationMailer
  default from: "alinear.mail+1@example.com"

  def snack_creation(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Snack has been created')
  end
end
