# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resource :current_user, only: :show, controller: :current_user

  resources :collections, only: %i[create update show index]

  mount Sidekiq::Web => "/sidekiq"
end
