# Gabriel Bolduc 8 novembre

class BusinessesController < ApplicationController

  # execute set_business and d'execute show
  before_action :set_business, only: %i[show]

  # page d'accueil
  def index
    @businesses = Business.order(name: :asc)

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
    @business = Business.includes(menus: [:items, { menus: :items }]).find(params[:id])
    # trouve entreprise
  end

end