require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    let(:snack) { FactoryBot.create(:snack) }


    it { should validate_presence_of(:name) }

    it { expect(snack).to validate_uniqueness_of(:name) }

    it { should validate_presence_of(:description) }

    it { should validate_length_of(:description).is_at_least(20) }
  end
end
