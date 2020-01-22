Rails.application.routes.draw do
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
resources :users
resources :artists do
  resources :favoriteArtist, only: [:create, :destroy]
end
resources :concerts do
  resources :upcomingConcert, only: [:create, :destroy]
end
resources :venues do
  resources :favoriteVenue, only: [:create, :destroy]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
