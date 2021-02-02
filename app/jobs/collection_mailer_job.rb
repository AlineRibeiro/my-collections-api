# frozen_string_literal: true

class CollectionMailerJob < ApplicationJob
  queue_as :default

  def perform(collection_id)
    collection = Collection.find(collection_id)
    CollectionMailer.collection_creation(collection)
  end
end
