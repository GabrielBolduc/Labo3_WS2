class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show]

  # GET /
  def index
    @businesses = Business.order(name: :asc)

    respond_to do |format|
      format.html
      format.json { render json: @businesses.to_json }
      format.xml  { render xml: @businesses.as_json.to_xml(root: 'businesses') }
    end
  end

  # GET /businesses/:id
  def show
    respond_to do |format|
      format.html
      format.json { render json: @business.as_json(include: { menus: { include: :items } }) }
      format.xml  { render xml: @business.as_json(include: { menus: { include: :items } }).to_xml(root: 'business') }
    end
  end

  private

  def set_business
    # précharge menus et items pour éviter N+1
    @business = Business.includes(menus: :items).find(params[:id])
  end

  # strong params (utile pour forms)
  def business_params
    params.require(:business).permit(
      :name, :description, :phone, :email, :site_web,
      menus_attributes: [
        :id, :title, :_destroy,
        items_attributes: [:id, :name, :price, :description, :_destroy]
      ]
    )
  end
end
