# frozen_string_literal: true

class CollectionMailer < ApplicationMailer
  def self.collection_creation(collection)
    mail_list = User.admins.pluck(:email)

    mail_list.each do |email|
      notify_collection_creation(email, collection).deliver_later
    end
  end

  def notify_collection_creation(email, collection)
    @email = email
    @collection_name = collection.name
    mail(to: email, subject: "Collection #{@collection_name} has been created")
  end
end
