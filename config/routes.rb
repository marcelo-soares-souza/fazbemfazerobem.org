Rails.application.routes.draw do
  resources :tipos do
    resources :entidades
  end

  resources :pedidos
  resources :projetos

  resources :entidades do
    resources :projetos
  end

  devise_for :users
  resources :users, :path => :usuarios

  get 'home/index'
  get 'sobre', to: 'home#sobre'

  root to: "home#index"
end
