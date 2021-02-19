# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hashtag, type: :model do

  describe 'associations' do
    it { should have_many(:company_hashtags) }

    it { should have_many(:companies).through(:company_hashtags) }
  end

  describe 'validations' do
    let(:hashtag) { FactoryBot.create(:hashtag) }

    it { should validate_presence_of(:name) }

    it { expect(hashtag).to validate_uniqueness_of(:name).case_insensitive }

    it { should validate_length_of(:name).is_at_least(4) }
  end
end
