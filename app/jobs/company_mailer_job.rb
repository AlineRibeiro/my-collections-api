# frozen_string_literal: true

class CompanyMailerJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)
    CompanyMailer.company_creation(company)
  end
end
