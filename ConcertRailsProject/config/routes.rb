Rails.application.routes.draw do
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
resources :users, only: :show
resources :artists
resources :concerts
resources :venues

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
