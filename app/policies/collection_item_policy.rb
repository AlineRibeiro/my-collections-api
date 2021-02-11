# frozen_string_literal: true

class CollectionItemPolicy < ApplicationPolicy
  attr_reader :user, :collection_item

  def initialize(user, collection_item)
    @user = user
    @collection_item = collection_item
  end

  def create?
    collection_owner_or_admin?
  end

  def update?
    collection_owner_or_admin?
  end

  def destroy?
    collection_owner_or_admin?
  end

  private

  def collection_owner_or_admin?
    collection_item.collection.user == user || user.admin?
  end
end
