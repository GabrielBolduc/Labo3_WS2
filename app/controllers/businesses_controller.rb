# Gabriel Bolduc

class BusinessesController < ApplicationController
  # Trouve le restaurant pour l'action 'show'
  before_action :set_business, only: [:show]

  # GET /
  # Page publique (/)
  # Liste le nom des entreprises en ordre alphabetique de nom(A à Z)
  def index
    @businesses = Business.order(name: :asc)
  end

  # GET /businesses/1
  # GET /businesses/1.json
  # GET /businesses/1.xml
  def show
    # @business est chargé par set_business
    
    respond_to do |format|
      format.html # utilise la vue show.html.erb
      
      # Gère les formats JSON et XML avec les menus et items inclus
      format.json { render json: @business.to_json(include: { menus: { include: :items } }) }
      format.xml  { render xml: @business.to_xml(include: { menus: { include: :items } }) }
    end
  end

  private

  def set_business
    # .includes pré-charge les menus et leurs items pour éviter
    # de multiples requêtes SQL dans la vue (problème N+1)
    @business = Business.includes(menus: :items).find(params[:id])
  end
end