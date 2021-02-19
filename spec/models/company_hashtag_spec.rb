# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyHashtag, type: :model do
  describe 'associations' do
    it { should belong_to(:hashtag) }
    it { should belong_to(:company) }
  end
end
