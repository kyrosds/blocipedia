Rails.application.routes.draw do
  resources :wikis

  devise_for :users

  get 'users/show'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
