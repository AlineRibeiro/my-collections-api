# frozen_string_literal: true

class SnackSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :snack_owner_email

  def snack_owner_email
    object.user.email
  end
end
