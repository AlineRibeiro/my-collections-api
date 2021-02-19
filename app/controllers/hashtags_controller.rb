class HashtagsController < ApplicationController

  def index
    hashtags = Hashtag.all
    render json: hashtags
  end
end
