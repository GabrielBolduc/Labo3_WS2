# Gabriel Bolduc
# Nouveau contrôleur pour la section privée "/mesmenus"

class MyMenusController < ApplicationController
  # 1. Exige que l'utilisateur soit connecté pour TOUTES les actions
  before_action :authenticate_user! 
  
  # 2. Appelle notre méthode 'set_business' avant l'action 'show'
  before_action :set_business, only: %i[show]

  # GET /mesmenus
  # Affiche la liste des restaurants de l'utilisateur
  def index
    # Titre de la page
    @page_title = "Mes Restaurants"
    
    # 3. On cherche les entreprises (businesses) SEULEMENT parmi
    #    celles qui appartiennent au 'current_user'.
    @businesses = current_user.businesses.includes(:menus).order(:name)
  end

  # GET /mesmenus/1
  # Affiche le détail d'un restaurant spécifique
  def show
    # @business est déjà chargé par 'set_business'
    # Titre de la page
    @page_title = @business.name
    
    # Rails va automatiquement afficher la vue 'show.html.erb'
  end

  private

  # Méthode pour trouver le restaurant
  def set_business
    # 4. On cherche le restaurant par son ID, mais en s'assurant
    #    qu'il appartient bien à l'utilisateur connecté.
    @business = current_user.businesses.includes(menus: [:items, { menus: :items }]).find_by(id: params[:id])

    # 5. Si on ne trouve rien (nil), c'est que le restaurant n'existe pas
    #    OU qu'il ne lui appartient pas. On redirige par sécurité.
    if @business.nil?
      redirect_to mesmenus_path, alert: "Restaurant non trouvé ou non autorisé."
    end
  end
end