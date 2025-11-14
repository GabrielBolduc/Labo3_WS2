# Gabriel Bolduc 8 novembre

class BusinessesController < ApplicationController

  # execute set_business and d'execute show
  before_action :set_business, only: %i[show]

  # page d'accueil
  def index
    if user_signed_in? && !current_user.admin?
      # affiche seulement businesses du user 
      @businesses = current_user.businesses.includes(menus: [:items, { menus: :items }]).order(name: :asc)
    else
      @businesses = Business.includes(menus: [:items, { menus: :items }]).order(name: :asc)
    end

    respond_to do |format|
      format.html
      format.json { render json: @businesses.to_json }
      format.xml  { render xml: @businesses.as_json.to_xml(root: 'businesses') }
    end
  end

  # page de detail
  def show
    options_inclusion = {
      include: {
        menus: {
          include: [
            :items,
            { menus: { include: :items } } 
          ]
        }
      }
    }

    respond_to do |format|
      format.html 
      format.json { render json: @business.to_json(options_inclusion) }
      
      format.xml  { render xml: @business.as_json(options_inclusion).to_xml(root: 'business') }
    end
  end

  private

  def set_business
    if user_signed_in? && !current_user.admin?
      # Affiche seulement business du user
      @business = current_user.businesses.includes(menus: [:items, { menus: :items }]).find(params[:id])
    else
      @business = Business.includes(menus: [:items, { menus: :items }]).find(params[:id])
    end
  end

end