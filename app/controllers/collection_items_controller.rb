# frozen_string_literal: true

class CollectionItemsController < ApplicationController
  def index
    collection_items = CollectionItem.all
    render json: collection_items
  end

  def create
    collection_id = params[:collection_id]
    collection_item = CollectionItem.new collection_item_params
    collection_item.collection = Collection.find(collection_id)
    if collection_item.save
      render json: collection_item, status: :created
    else
      render json: { errors: collection_item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    collection_item_id = params[:id]
    collection_id = params[:collection_id]
    collection_item = CollectionItem.find_by(collection_id: collection_id, id: collection_item_id)
    if collection_item
      render json: collection_item
    else
      render json: { errors: 'This item does not exist' }
    end
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:name, :description, :maker, :paid_price, :current_value, :serial_number,
                                            :origin, :circa, :condition, :signed)
  end
end
