class SnacksController < ApplicationController
  def index
    render json: { snacks: 'snack index' }
  end
end
