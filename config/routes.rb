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
  get 'porque', to: 'home#porque'
  get 'como', to: 'home#como'
  get 'doadores', to: 'home#doadores'
  get 'parceiros', to: 'home#parceiros'

  root to: "home#index"
end
