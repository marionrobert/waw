Rails.application.routes.draw do
  get 'email_contacts/new'
  get 'email_contacts/create'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post '/sign_in_as_guest_user', to: 'users/sessions#sign_in_as_guest_user', as: :sign_in_as_guest_user
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "pages#home"


  resources :blogposts
  resources :carts
  resources :favorites, only: [:index, :destroy]
  resources :shops, only: %i[new create edit update show]

  resources :coupons
  get "/amount_off", to: "coupons#amount_off", as: :amount_off_coupon
  get "/percent_off", to: "coupons#percent_off", as: :percent_off_coupon

  resources :line_items
  post 'line_items/addone'
  post 'line_items/removeone'

  resources :categories do
    resources :subcategories
  end

  resources :orders, only: %i[show create update] do
    resources :payments, only: :new
  end

  resource :contacts, only: %i[new create] do
    collection do
      get :thanks
    end
  end

  resources :email_contacts, only: [:new, :create]
  post 'newsletter/subscribe', to: 'email_contacts#create'



  resources :products do
    member do
      get :preview
      get :deletepreview
    end
    resources :favorites, only: [:create]
    collection do
      post :search, to: 'products#index'
    end
  end

  get "stockmanagement", to: "pages#stockmanagement"
  get 'profile', to: 'pages#profile'
  get 'promo', to: 'promo#index'
  get 'cookies', to: "cookies#index"
  get 'search', to: 'search#index'
  get 'payments/new'
  get 'legal', to: 'pages#legal'
  get 'cgv', to: 'pages#cgv'
end
