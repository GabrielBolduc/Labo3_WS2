# Gabriel Bolduc 8 novembre

class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show]

  # GET /
  def index
    # tri
    @businesses = Business.order(name: :asc)

    respond_to do |format|
      format.html
      format.json { render json: @businesses.to_json }
      format.xml  { render xml: @businesses.as_json.to_xml(root: 'businesses') }
    end
  end

  # GET /businesses/:id
  def show
    options_inclusion = {
      include: {
        menus: {
          include: [
            :items,
            # --- MODIFICATION ICI --- (sub_menus -> menus)
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
    # --- MODIFICATION ICI --- (sub_menus -> menus)
    @business = Business.includes(menus: [:items, { menus: :items }]).find(params[:id])
  end

  def business_params
    params.require(:business).permit(
      :name, :description, :phone, :email, :site_web,
      menus_attributes: [
        :id, :title, :_destroy,
        # --- MODIFICATION ICI --- (sub_menus_attributes -> menus_attributes)
        menus_attributes: [
          :id, :title, :_destroy,
          items_attributes: [:id, :name, :price, :description, :_destroy]
        ]
      ]
    )
  end
end