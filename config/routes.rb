Rails.application.routes.draw do
  resources :apoiars, :path => :apoiar

  resources :tipos do
    resources :entidades
  end

  resources :pedidos

  resources :projetos do
    resources :apoiars, :path => :apoiar
  end

  resources :entidades do
    resources :projetos
  end

  devise_for :users
  resources :users, :path => :usuarios

  get 'home/index'
  get 'sobre', to: 'home#sobre'

  root to: "home#index"
end
