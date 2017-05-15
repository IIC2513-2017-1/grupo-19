Rails.application.routes.draw do

  resources :prizes
  resources :prize_categories
  resources :notifications
  resources :comments
  resources :messages
  resources :winners
  resources :purchases
  resources :numbers
  resources :raffles
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
  end
  resources :conversations do
    resources :messages
 end
end
