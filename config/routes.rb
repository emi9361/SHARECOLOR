Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations'}
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'home#top'
  resources :users
  resources :stages do
  resource :favorites, only:[:create, :destroy]
  resource :genres, only:[:create, :destroy]
  resource :moods, only:[:create, :destroy]
  resource :hashtag, only:[:create, :destroy]
  end

  resources :sounds do
  resource :favorites, only:[:create, :destroy]
  resource :genres, only:[:create, :destroy]
  resource :moods, only:[:create, :destroy]
  resource :hashtag, only:[:create, :destroy]
  member do
  get 'sound_for'
  end
  end

  resources :videos do
  resource :favorites, only:[:create, :destroy]
  resource :genres, only:[:create, :destroy]
  resource :moods, only:[:create, :destroy]
  resource :hashtag, only:[:create, :destroy]
  end
  
  get '/search', to: 'search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
