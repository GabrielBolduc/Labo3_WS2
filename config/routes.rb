#Gabriel Bolduc 8 novembre

Rails.application.routes.draw do
  get "my_menus/index"
  get "my_menus/show"
  
  devise_for :users
  
  root "businesses#index"

  resources :businesses, only: [:index, :show]

  
  get "/mesmenus", to: "my_menus#index"
  
  get "/mesmenus/:id", to: "my_menus#show", as: :my_menu

  namespace :admin do
    root "businesses#index"
    resources :businesses, only: [:index, :show]
  end
end