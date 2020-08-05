Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations'}

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'home#top'

  resources :users do
    resource :follows, only: [:create, :destroy]
    get '/follows', to: 'follows#follower', as: 'followses'
    get '/fallowers', to: 'follows#followed', as: 'followers'
  end

  resources :stages do
  post '/favorites', to: 'favorites#stage_create'
  delete '/favorites', to: 'favorites#stage_destroy'
  resource :genres, only:[:create, :destroy]
  resource :hashtag, only:[:create, :destroy]
  collection do
    get "auto_complete"
  end
  end

  resources :sounds do
  post '/favorites', to: 'favorites#sound_create'
  delete '/favorites', to: 'favorites#sound_destroy'
  resource :genres, only:[:create, :destroy]
  resource :moods, only:[:create, :destroy]
  resource :hashtag, only:[:create, :destroy]
  resource :video_sources, only: [:create, :destroy]
  collection do
    get "auto_complete"
  end
  member do
  get 'sound_for'
  end
  end

  resources :videos do
  post '/favorites', to: 'favorites#video_create'
  delete '/favorites', to: 'favorites#video_destroy'
  resource :hashtag, only:[:create, :destroy]
  resource :sound_sources, only: [:create, :destroy]
  collection do
    get "auto_complete"
  end
  end

  get '/search', to: 'search#search'
  resources :notifications, only: :index
  get '/sound/hashtag/:name', to: "sounds#hashtag"
  get '/sound/hashtag', to: "sounds#hashtag"

  get '/video/hashtag/:name', to: "videos#hashtag"
  get '/video/hashtag', to: "videos#hashtag"

  get '/stage/hashtag/:name', to: "stages#hashtag"
  get '/stage/hashtag', to: "stages#hashtag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
