class SnacksController < ApplicationController
  def index
    render json: { snacks: 'this is the snacks index' }
  end
end
