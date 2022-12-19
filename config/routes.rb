Rails.application.routes.draw do
  resources :line_items
  post 'line_items/addone'
  post 'line_items/removeone'
  resources :carts

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "pages#home"
  get 'payments/new'
  get 'shops/legal'
  get 'shops/cgv'


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
  get 'profile', to: 'pages#profile'


  # boutton de la landing page qui envoi vers tout les produits
  get "/products ", to: "products#index"
  resource :contacts, only: %i[new create] do
    get "/thanks" => "contacts#thanks"
  end

  # coupon
  resources :coupons
  get "/amount_off", to: "coupons#amount_off", as: :amount_off_coupon
  get "/percent_off", to: "coupons#percent_off", as: :percent_off_coupon

  resources :categories do
    resources :subcategories
  end

  # autocomplete
  resources :products do
    collection do
      post :search
    end
  end

  # favorites
  resources :products, only: [:index, :show] do
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:index, :destroy]


end
