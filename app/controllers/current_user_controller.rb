# frozen_string_literal: true

class CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user
  end
end
