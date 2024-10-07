Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tests#index"

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :signout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: %i[ create destroy ]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resource :test_passages, only: %i[ show update ] do
    member do
      get :result
    end
  end
end
