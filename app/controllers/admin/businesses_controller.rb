# Gabriel Bolduc

# Notez que la classe est "Admin::BusinessesController"
# et qu'elle hérite de "AdminController"
class Admin::BusinessesController < AdminController
  before_action :set_business, only: [:show]

  # GET /admin
  # Les restaurants sont listés ordre inverse (Z à A)
  def index
    @businesses = Business.order(name: :desc)
  end

  # GET /admin/businesses/1
  def show
    # @business est chargé par set_business
  end

  private

  def set_business
    # --- MODIFICATION ICI --- (sub_menus -> menus)
    @business = Business.includes(menus: [:items, { menus: :items }]).find(params[:id])
  end
end