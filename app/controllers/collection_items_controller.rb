# frozen_string_literal: true

class CollectionItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_collection,  only: [:create]
  before_action :find_collection_item, only: %i[show update destroy]

  def index
    collection_items = CollectionItem.all
    render json: collection_items
  end

  def create
    collection_item = CollectionItem.new collection_item_params
    collection_item.collection = @collection
    authorize collection_item
    if collection_item.save
      render json: collection_item, status: :created
    else
      render json: { errors: collection_item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    render json: @collection_item if @collection_item
  end

  def update
    if @collection_item.update(collection_item_params)
      render json: @collection_item
    else
      render json: { errors: @collection_item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @collection_item.delete
      render json: { message: 'Item had been deleted' }
    else
      render json: { errors: @collection_item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:name, :description, :maker, :paid_price, :current_value, :serial_number,
                                            :origin, :circa, :condition, :signed)
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def find_collection_item
    @collection_item = CollectionItem.find_by(collection_id: params[:collection_id], id: params[:id])

    render json: { error: 'Item does not exist' } if @collection_item.nil?
  end
end
