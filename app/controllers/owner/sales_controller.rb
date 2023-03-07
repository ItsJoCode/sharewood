class Owner::SalesController < ApplicationController
  before_action :set_sale, only: %i[show]

  def index
    @sales = Sale.where(product_id: current_user.products).near(current_user, 10)
    # The `geocoded` scope filters only sales with coordinates
    @markers = @sales.geocoded.map do |sale|
      {
        lat: sale.latitude,
        lng: sale.longitude,
        marker_html: render_to_string(partial: "marker", locals: { sale: sale })
      }
    end
    # current_user marker
    @markers.unshift(
      {
        lat: current_user.latitude,
        lng: current_user.longitude,
        marker_html: render_to_string(partial: "marker", locals: { sale: current_user })
      }
    )
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @product = Product.find(params[:product_id])
    @sale.product = @product
    if @sale.save
      redirect_to owner_sale_path(@sale)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:address, :sale_capacity, :end_date, :price_reduction, :progress)
  end
end
