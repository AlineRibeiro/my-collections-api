# frozen_string_literal: true

class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :owner_email

  def owner_email
    object.user.email
  end
end
