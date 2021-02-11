# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resource :current_user, only: :show, controller: :current_user

  resources :collections, only: %i[create update show index] do
    resources :collection_items
  end
end
