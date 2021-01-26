# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resource :current_user, only: :show, controller: :current_user

  resources :snacks, only: [:index]
end
