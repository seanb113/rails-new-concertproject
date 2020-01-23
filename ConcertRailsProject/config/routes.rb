Rails.application.routes.draw do

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
resources :locations
resources :users
resources :artists do
  resources :favorite_artists, only: [:create, :destroy]
end
resources :concerts do
  resources :upcoming_concerts, only: [:create, :destroy]
  resources :reviews, only: :create
end
resources :venues do
  resources :favorite_venues, only: [:create, :destroy]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
