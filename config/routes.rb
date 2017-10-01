Rails.application.routes.draw do
  resources :wikis

  resources :charges, only: [:new, :create, :destroy]

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  get '/charges', to: 'charges#destroy', as: :downgrade

  devise_for :users

  root 'welcome#index'
end
