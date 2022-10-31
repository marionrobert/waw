Rails.application.routes.draw do
  resources :line_items
  resources :carts

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

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

  resources :shops, only: %i[new create edit update show]

  #commande
  resources :orders, only: %i[show create update] do
    resources :payments, only: :new
  end
  #dashboard
  get 'profil/:id', to: 'pages#profil'


  # boutton de la landing page qui envoi vers tout les produits
  get "/products ", to: "products#index"
  resource :contacts, only: %i[new create] do
    get "/thanks" => "contacts#thanks"
  end
end
