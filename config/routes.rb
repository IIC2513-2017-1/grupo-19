Rails.application.routes.draw do

  resources :prizes, only: [:index]
  resources :prize_categories
  resources :messages
  resources :raffles do
    post '/draw_raffle', to: 'raffles#draw_raffle'
    resources :winners
    resources :numbers, only: [:index, :create, :destroy]
    resources :prizes, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :comments, only: [:create, :edit, :destroy, :show]
    resources :comments do
      resources :comments, only: [:new, :create]
    end
  end
  resources :raffle_categories
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    resources :raffles
    resources :notifications, only: [:index, :create, :update]
    resources :relationships
  end
  resources :conversations do
    resources :messages
  end
end
