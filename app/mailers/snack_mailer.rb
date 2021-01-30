class SnackMailer < ApplicationMailer
  default from: "alinear.mail+1@example.com"

  def self.snack_creation(snack)
    admins = User.admins
    mail_list = admins.map { |admin| admin.email }

    mail_list.each do |email|
      send_snack_creation(email, snack).deliver_now
    end
  end

  def send_snack_creation(email, snack)
    @email = email
    @snack_name = snack.name
    mail(to: email, subject: "Snack #{@snack_name} has been created")
  end
end
