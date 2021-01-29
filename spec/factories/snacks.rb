# frozen_string_literal: true

FactoryBot.define do
  factory :snack do
    name { 'TestProduct' }
    description { 'This is the description for the TestProduct' }
    user
  end
end
