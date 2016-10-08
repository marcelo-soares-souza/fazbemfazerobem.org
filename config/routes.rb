Rails.application.routes.draw do
  resources :entidades
  devise_for :users
  resources :users

  get 'home/index'

  root to: "home#index"
end
