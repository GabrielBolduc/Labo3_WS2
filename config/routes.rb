#Gabriel Bolduc 8 novembre

Rails.application.routes.draw do
  # 1. Page publique (/)
  root "businesses#index"

  # 2. Page publique de détail (/businesses/1)
  # Ne crée que les routes :index et :show
  resources :businesses, only: [:index, :show]

  # 3. Section Administrative
  # Crée les routes /admin et /admin/businesses/1
  namespace :admin do
    root "businesses#index"
    resources :businesses, only: [:index, :show]
  end
end