Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'shops#index'

  resources :shops do
    resources :menus
    resources :comments, only: [:create, :index]
    resource :favorites, only: [:show, :create, :destroy]
    collection do
      get 'search'
    end
  end
  
  scope '/' do
    resources :favorites, only: [:index]
  end
end
