# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyHashtag, type: :model do
  let(:company_hashtag) { FactoryBot.create(:company_hashtag) }

  describe 'associations' do
    it { should belong_to(:hashtag) }

    it { should belong_to(:company) }
  end

  describe 'validations' do
    it {
      expect(company_hashtag).to validate_uniqueness_of(:hashtag_id)
                                     .scoped_to(:company_id)
                                     .with_message('This hashtag has already been assigned to this business')
    }
  end
end
