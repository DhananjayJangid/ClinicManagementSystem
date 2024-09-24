Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  namespace :receptionists do
    get 'dashboard/index'
    get 'dashboard', to: 'dashboard#index'
    resources :patients
  end

  namespace :doctors do
    get 'dashboard/index'
    get 'dashboard/graph'
    get 'dashboard', to: 'dashboard#index'
    resources :patients
  
  get 'doctors/dashboard', to: 'doctors#dashboard', as: :doctors_dashboard
  
  # Route for chart data
  get 'patients_chart', to: 'patients#chart_data'
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
