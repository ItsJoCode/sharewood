class Customer::SalesController < ApplicationController
  before_action :set_sale, only: %i[show]

  def index
    @sales = Sale.where(product_id: current_user.products)
  end

  def show
    @order = Order.new
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:address, :sale_capacity, :end_date, :price_reduction, :progress)
  end
end
