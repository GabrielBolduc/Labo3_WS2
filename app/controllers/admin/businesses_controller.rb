# Gabriel Bolduc

class Admin::BusinessesController < AdminController
  before_action :set_business, only: [:show]

  def index
    @businesses = Business.order(name: :desc)
  end

  def show
    # @business charge par set_business
  end

  private

  def set_business
    @business = Business.includes(:menus).find(params[:id])
    # trouve entreprise
  end
end