Rails.application.routes.draw do

  #get 'orders/index'
  #get 'orders/show'
  #get 'orders/new'
  #get 'orders/create'
  #get 'orders/update'
  #get 'orders/destroy'
  #get 'products/index'
  #get 'products/show'
  #get 'products/new'
  #get 'products/create'
  #get 'products/update'
  #get 'products/destroy'
  #users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  devise_for :users
  #racine index articles
  root to: "products#index"
  #articles
  resources :products, only: %i[index show new update]
  #commande
  resources :orders, only: %i[create update]
  #dashboard
  get 'profil/:id', to: 'pages#profil'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
