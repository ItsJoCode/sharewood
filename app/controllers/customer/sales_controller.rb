class Customer::SalesController < ApplicationController
  before_action :set_sale, only: %i[show]

  def index
    # @sales = Sale.where(product_id: current_user.products)
    @sales = current_user.near_sales
    @sales = @sales.global_search(params[:query]) if params[:query].present?
    # @markers = current_user.near_markers
    @markers = current_user.near_markers_for(@sales)

    # @sales = Sale.all
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "sales/list", locals: { sales: @sales }, formats: [:html] }
    end
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
