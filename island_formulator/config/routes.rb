Rails.application.routes.draw do
  get "dashboards/show"
  resources :batches
  resources :ingredients
  resources :recipes
  get "users/new"
  get "users/create"

  resource :session
  resources :users, only: [ :new, :create ]
  resource :password, param: :token
  resources :ingredients

  resources :inventory_items
  resources :batches, only: [ :index, :show, :new, :create, :destroy ]

  root "dashboards#show"
end
