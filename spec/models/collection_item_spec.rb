# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:collection) }
  end

  describe 'validations' do
    let(:collection_item) { FactoryBot.create(:collection_item) }

    it { is_expected.to validate_presence_of(:name) }
  end
end
