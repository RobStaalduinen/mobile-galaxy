require 'sidekiq/web'

Rails.application.routes.draw do

  resources :ios_listings, only: [ :index, :show, :update ]
  resources :android_listings, only: [ :index, :show, :update ]

  put '/ios_listings/record_event', to: "ios_listings#record_event"
  put '/android_listings/record_event', to: "android_listings#record_event"

  mount Sidekiq::Web => '/sidekiq'

  root to: 'welcome#landing'
end
