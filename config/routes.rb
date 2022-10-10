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
  devise_for :users
  root to: "products#index"
  #resources :products
  get 'profil/:id', to: 'pages#profil', as: :profil
  resources :products, only: %i[index show new update] do
    resources :orders, only: %i[create update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
