# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    let(:collection) { FactoryBot.create(:collection) }

    it { is_expected.to validate_presence_of(:name) }

    it { expect(collection).to validate_uniqueness_of(:name).case_insensitive }

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_length_of(:description).is_at_least(20) }
  end
end
