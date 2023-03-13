class Customer::OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @sale = Sale.find(params[:sale_id])
    @order.sale = @sale
    @order.user = current_user
    if @order.save
      redirect_to customer_orders_path
    else
      render 'customer/sales/show', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:capacity)
  end
end
