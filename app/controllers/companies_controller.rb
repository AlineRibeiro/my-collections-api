# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_company, only: %i[show update]

  def index
    companies = Company.all
    render json: companies
  end

  def create
    company = Company.new company_params
    company.user = current_user
    if company.save
      render json: company, status: :created
      CompanyMailerJob.perform_later(company.id)
    else
      render(
        json: { errors: company.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  def show
    render json: @company
  end

  def update
    if @company.update company_params
      render json: @company
    else
      render(
        json: { errors: @company.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  private

  def find_company
    @company = Company.find params[:id]
  end

  def company_params
    params.require(:company).permit(:name, :description)
  end
end
