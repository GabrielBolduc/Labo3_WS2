#Gabriel Bolduc 8 novembre

Rails.application.routes.draw do
  root "businesses#index"

  resources :businesses, only: [:index, :show]

  namespace :admin do
    root "businesses#index"
    resources :businesses, only: [:index, :show]
  end
end