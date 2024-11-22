Rails.application.routes.draw do
  devise_for :users
  root 'properties#index'

  resources :properties

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
end
