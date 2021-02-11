# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { 'TestCompany' }
    description { 'This is the description for the TestCompany' }
    user
  end
end
