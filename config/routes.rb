Rails.application.routes.draw do
  resources :wikis

  devise_for :users

  get 'users/show'

  root 'welcome#index'
end
