# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_collection, only: %i[show update]

  def index
    collections= Collection.all
    render json: collections
  end

  def create
    collection = Collection.new collection_params
    collection.user = current_user
    if collection.save
      render json: collection, status: :created
      CollectionMailerJob.perform_later(collection.id)
    else
      render(
        json: { errors: collection.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  def show
    render json: @collection
  end

  def update
    if @collection.update collection_params
      render json: @collection
    else
      render(
        json: { errors: @collection.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  private

  def find_collection
    @collection = Collection.find params[:id]
  end

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
