#Gabriel Bolduc 8 novembre
# Mis à jour pour inclure les routes "Mes Menus"

Rails.application.routes.draw do
  get "my_menus/index"
  get "my_menus/show"
  
  # Routes Devise (déjà ajoutées)
  devise_for :users
  
  # La racine publique reste la liste des entreprises
  root "businesses#index"

  # Routes publiques pour les entreprises
  resources :businesses, only: [:index, :show]

  # --- AJOUT: Section Privée "Mes Menus" ---
  
  # URL: /mesmenus
  # Action: 'index' dans 'my_menus_controller'
  get "/mesmenus", to: "my_menus#index"
  
  # URL: /mesmenus/1 (par exemple)
  # Action: 'show' dans 'my_menus_controller'
  # 'as: :my_menu' crée un "helper" (my_menu_path) pour générer ce lien
  get "/mesmenus/:id", to: "my_menus#show", as: :my_menu

  # --- Fin de l'ajout ---

  # Section Admin (déjà existante)
  namespace :admin do
    root "businesses#index"
    resources :businesses, only: [:index, :show]
  end
end