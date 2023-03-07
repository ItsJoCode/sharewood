class Owner::SalesController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @sales = Sale.where(product_id: current_user.products)
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
