# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:company_hashtags) }

    it { is_expected.to have_many(:hashtags).through(:company_hashtags) }
  end

  describe 'validations' do
    let(:company) { FactoryBot.create(:company) }

    it { is_expected.to validate_presence_of(:name) }

    it { expect(company).to validate_uniqueness_of(:name).case_insensitive }

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_length_of(:description).is_at_least(20) }
  end
end
