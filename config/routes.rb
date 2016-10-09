Rails.application.routes.draw do
  resources :entidades
  devise_for :users
  resources :users

  get 'home/index'
  get 'sobre', to: 'home#sobre'

  root to: "home#index"
end
