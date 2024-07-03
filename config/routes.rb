Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Pour voir la liste de tous les restaurants
  get 'restaurants', to: 'restaurants#index'

  # Pour ajouter un nouveau restaurant
  get 'restaurants/new', to: 'restaurants#new'
  post 'restaurants', to: 'restaurants#create'
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  # Pour voir les détails d’un restaurant, avec tous les avis associés au restaurant
  get 'restaurants/:id', to: 'restaurants#show'

  #  Pour ajouter un nouvel avis à un restaurant
  get 'restaurants/:id/reviews/new', to: 'reviews#new'
  post 'restaurants/:id/reviews', to: 'reviews#create'

end
