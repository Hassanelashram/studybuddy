Rails.application.routes.draw do
  devise_for :users
  resources :after_signup
  root to: 'pages#home'
  resource :dashboard, only: :show
  get "/results", to: 'users#index', as: "results"
  get "/allbookings", to: 'dashboards#allbookings', as: "allbookings"
  get "/allearnings", to: 'dashboards#allearnings', as: "allearnings"
  get "/users/:id", to: 'users#profile', as: "profile"
  resources :user do
    resources :reviews, only: [:create]
  end

  resources :chats, only: [:index, :create, :show] do
   resources :messages, only:  :create
  end
  resources :users do
  	resources :bookings, only: :create
  end

  resources :bookings, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
