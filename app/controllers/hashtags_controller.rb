class HashtagsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    hashtags = Hashtag.all
    render json: hashtags
  end

  def create
    hashtag = Hashtag.new hashtag_params
    if hashtag.save
      render json: hashtag, status: :created
    else
      render(
          json: { errors: hashtag.errors.full_messages },
          status: :unprocessable_entity
      )
    end
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:name)
  end
end

























