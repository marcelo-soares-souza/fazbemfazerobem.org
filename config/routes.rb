Rails.application.routes.draw do
  resources :pedidos
  resources :projetos
  resources :entidades do
    resources :projetos
  end

  devise_for :users
  resources :users

  get 'home/index'
  get 'sobre', to: 'home#sobre'

  root to: "home#index"
end
