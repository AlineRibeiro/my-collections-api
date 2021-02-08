# frozen_string_literal: true

class CollectionItemsController < ApplicationController
  before_action :set_collection,  only: [:create]

  def index
    collection_items = CollectionItem.all
    render json: collection_items
  end

  def create
    collection_item = CollectionItem.new collection_item_params
    collection_item.collection = @collection_id
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

  def update
    collection_item_id = params[:id]
    collection_id = params[:collection_id]
    collection_item = CollectionItem.find_by(collection_id: collection_id, id: collection_item_id)
    if collection_item.update(collection_item_params)
      render json: collection_item
    else
      render json: { errors: collection_item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    collection_item_id = params[:id]
    collection_id = params[:collection_id]
    collection_item = CollectionItem.find_by(collection_id: collection_id, id: collection_item_id)
    if collection_item.delete
      render json: { message: 'Item had been deleted' }
    else
      render json: { errors: collection_item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:name, :description, :maker, :paid_price, :current_value, :serial_number,
                                            :origin, :circa, :condition, :signed)
  end

  def set_collection
    @collection_id = Collection.find(params[:collection_id])
  end



end
