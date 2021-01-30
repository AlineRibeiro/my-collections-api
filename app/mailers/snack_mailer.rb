# frozen_string_literal: true

class SnackMailer < ApplicationMailer
  def self.snack_creation(snack)
    admins = User.admins
    mail_list = admins.map(&:email)

    mail_list.each do |email|
      notify_snack_creation(email, snack).deliver_now
    end
  end

  def notify_snack_creation(email, snack)
    @email = email
    @snack_name = snack.name
    mail(to: email, subject: "Snack #{@snack_name} has been created")
  end
end
