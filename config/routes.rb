Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'payments/new'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products, only: %i[index show new update search]
  resources :products do
    member do
      get 'search'
    end
  end

  #commande
  resources :orders, only: %i[show create update] do
    resources :payments, only: :new
  end
  #dashboard
  get 'profil/:id', to: 'pages#profil'


  # boutton de la landing page qui envoi vers tout les produits
  get "/products ", to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
