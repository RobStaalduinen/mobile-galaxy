require 'sidekiq/web'

Rails.application.routes.draw do

  resources :ios_listings, only: [ :index, :show, :update ]
  resources :android_listings, only: [ :index, :show, :update ]

  mount Sidekiq::Web => '/sidekiq'

  root to: 'welcome#landing'
end
