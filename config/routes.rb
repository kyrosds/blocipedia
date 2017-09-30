Rails.application.routes.draw do
  resources :charges, only: [:new, :create, :destroy]

  get '/charges', to: 'charges#destroy', as: :downgrade

  resources :wikis

  devise_for :users

  root 'welcome#index'
end
