# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, admin: true, email: 'admin@email.com') }
  let(:collection) { FactoryBot.create(:collection, user: user) }

  describe '#notify_collection_creation' do
    let(:mail) { CollectionMailer.notify_collection_creation(admin.email, collection) }

    it 'sends email from default email' do
      expect(mail.from).to eq(['test@email.com'])
    end

    it 'sends out emails to admin when collection is created' do
      expect(mail.to).to eq([admin.email])
    end

    it 'displays email subject' do
      expect(mail.subject).to eq("Collection #{collection.name} has been created")
    end

    it 'renders email body' do
      expect(mail.body.encoded).to match("A new collection has been created: #{collection.name}")
    end
  end
end
