Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  resources :photos, only: [:index, :show] do
    resources :orders, only: [:create]
  end

  namespace :admin do
    resources :photos
    get 'dashboard', to: 'dashboard#index'
  end

  resources :cart_items
  resources :orders

  root 'photos#index'
end
