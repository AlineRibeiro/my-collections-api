# frozen_string_literal: true

class CompanyMailer < ApplicationMailer
  def self.company_creation(company)
    mail_list = User.admins.pluck(:email)

    mail_list.each do |email|
      notify_company_creation(email, company).deliver_later
    end
  end

  def notify_company_creation(email, company)
    @email = email
    @company_name = company.name
    mail(to: email, subject: "Company #{@company_name} has been created")
  end
end
