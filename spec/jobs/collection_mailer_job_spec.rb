# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionMailerJob, type: :job do
  let(:collection) { FactoryBot.create(:collection) }

  it 'sends out an email on collection creation' do
    expect(CollectionMailer).to receive(:collection_creation).and_call_original

    CollectionMailerJob.new.perform(collection.id)
  end
end
