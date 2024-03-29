class Owner::SalesController < ApplicationController
  before_action :set_sale, only: %i[show update]

  def index
    # @sales = current_user.near_sales
    # @markers = @sales.define_markers
    # @sales = Sale.all
    @sales = current_user.product_sales
    # @notifications = Notification.where(sale_id: owner_notifications)
    # @sales = []
    # current_user.products.each { |product| @sales << product.sales }
    # @sales = @sales.flatten
  end

  def show
    # @notifications = Notification.where(sale_id: owner_notifications)
  end

  def new
    @sale = Sale.new
    @product = Product.find(params[:product_id])
  end

  def create
    @sale = Sale.new(sale_params)
    @product = Product.find(params[:product_id])
    @sale.product = @product
    if @sale.save!
      redirect_to owner_sale_path(@sale)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @sale.update(sale_params)
    redirect_to owner_sales_path(anchor: "delivred-sales")
  end

  private

  # def owner_notifications
  #   confirmed = current_user.sales.select {|sale| sale.progress == "confirmed"}
  #   confirmed.pluck(:id)
  # end

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:address, :sale_capacity, :end_date, :price_reduction, :progress, :photo)
  end
end
