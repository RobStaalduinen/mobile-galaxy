Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :ios_listings, only: [ :index, :show, :update ]

  root to: 'welcome#landing'
end
