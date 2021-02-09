class CollectionItemPolicy < ApplicationPolicy
    attr_reader :user, :collection_item

    def initialize(user, collection_item)
      @user = user
      @collection_item = collection_item
    end

    def create?
      collection_item.collection.user == user || user.admin?
    end

    def update?
      collection_item.collection.user == user || user.admin?
    end

    def destroy?
      collection_item.collection.user == user || user.admin?
    end
end
