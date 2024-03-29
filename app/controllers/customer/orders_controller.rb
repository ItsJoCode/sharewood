class Customer::OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
    @review = Review.new
  end

  def create
    @order = Order.new(order_params)
    @sale = Sale.find(params[:sale_id])
    @order.sale = @sale
    @order.user = current_user
    if @order.save!
      @sale.update(current_capacity: @sale.current_capacity + @order.capacity)
      @sale.update_sale_status
      redirect_to customer_sale_path(@sale, anchor: "sales-wrapper")
    else
      render 'customer/sales/show', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:capacity)
  end
end
