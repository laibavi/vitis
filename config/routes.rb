Rails.application.routes.draw do
  namespace :admin do
    get 'pictures/create'
  end
  namespace :admin do
    get 'collections/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "search", to: "search#index"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources "users"
  namespace :admin do
      get "/", to: "home#index"
      resources :collections
      resources :types
      get '/user/:id/update_admin', to: "users#update_admin", as: :user_admin
      resources :pictures
      resources :users
      resources :products
  end
end
