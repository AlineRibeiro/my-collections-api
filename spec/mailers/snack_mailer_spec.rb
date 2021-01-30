# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SnackMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, admin: true, email: 'admin@email.com') }
  let(:snack) { FactoryBot.create(:snack, user: user) }

  describe "#notify_snack_creation" do

    let(:mail) { SnackMailer.notify_snack_creation(admin.email, snack) }

    it "sends email from default email" do
      expect(mail.from).to eq(['test@email.com'])
    end

    it "sends out emails to admin when snack is created" do
      expect(mail.to).to eq([admin.email])
    end

    it "displays email subject" do
      expect(mail.subject).to eq("Snack #{snack.name} has been created")
    end

     it "renders email body" do
      expect(mail.body.encoded).to match("A new snack has been created: #{snack.name}")
     end
  end

end
