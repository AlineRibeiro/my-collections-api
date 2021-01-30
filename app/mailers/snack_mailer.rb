class SnackMailer < ApplicationMailer
  default from: "alinear.mail+1@example.com"

  def self.snack_creation
    admins = User.admins
    mail_list = admins.map { |admin| admin.email }

    mail_list.each do |email|
      send_snack_creation(email).deliver_now
    end
  end

  def send_snack_creation(email)
    @email = email
    @url  = 'http://example.com/login'
    mail(to: email, subject: 'Snack has been created')
  end
end
