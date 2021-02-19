# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resource :current_user, only: :show, controller: :current_user

  resources :companies, only: %i[create update show index]

  resources :hashtags, only: %i[create update show index]
end
