# frozen_string_literal: true

class SnacksController < ApplicationController
  def index
    render json: { snacks: 'this is the snacks index' }
  end
end
