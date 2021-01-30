# frozen_string_literal: true

class SnacksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_snack, only: %i[show update]

  def index
    snacks = Snack.all
    render json: snacks
  end

  def create
    snack = Snack.new snack_params
    snack.user = current_user
    if snack.save
      render json: snack, status: :created
      SnackMailer.snack_creation(snack)
    else
      render(
        json: { errors: snack.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  def show
    render json: @snack
  end

  def update
    if @snack.update snack_params
      render json: @snack
    else
      render(
        json: { errors: @snack.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  private

  def find_snack
    @snack = Snack.find params[:id]
  end

  def snack_params
    params.require(:snack).permit(:name, :description)
  end
end
