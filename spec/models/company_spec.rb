# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    let(:company) { FactoryBot.create(:company) }

    it { should validate_presence_of(:name) }

    it { expect(company).to validate_uniqueness_of(:name).case_insensitive }

    it { should validate_presence_of(:description) }

    it { should validate_length_of(:description).is_at_least(20) }
  end
end
