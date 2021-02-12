# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, admin: true, email: 'admin@email.com') }
  let(:company) { FactoryBot.create(:company, user: user) }

  describe '#notify_company_creation' do
    let(:mail) { CompanyMailer.notify_company_creation(admin.email, company) }

    it 'sends email from default email' do
      expect(mail.from).to eq(['test@email.com'])
    end

    it 'sends out emails to admin when company is created' do
      expect(mail.to).to eq([admin.email])
    end

    it 'displays email subject' do
      expect(mail.subject).to eq("Company #{company.name} has been created")
    end

    it 'renders email body' do
      expect(mail.body.encoded).to match("A new company has been created: #{company.name}")
    end
  end
end
