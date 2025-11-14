# Gabriel Bolduc

class MyMenusController < ApplicationController
  before_action :authenticate_user! 
  
  before_action :set_business, only: %i[show]

  def index
    @page_title = "Mes Restaurants"
    
    # cherche businesses qui appartiennent au current_user
    @businesses = current_user.businesses.includes(:menus).order(:name)
  end

  def show
    @page_title = @business.name
    
  end

  private

  # trouver le restaurant
  def set_business
    @business = current_user.businesses.includes(menus: [:items, { menus: :items }]).find_by(id: params[:id])

    if @business.nil?
      redirect_to mesmenus_path
    end
  end
end