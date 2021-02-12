# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyMailerJob, type: :job do
  let(:company) { FactoryBot.create(:company) }

  it 'sends out an email on company creation' do
    expect(CompanyMailer).to receive(:company_creation).and_call_original

    CompanyMailerJob.new.perform(company.id)
  end
end
