class Customer::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    if @review.save
      redirect_to product_path(@order.sale.product), notice: "Votre avis a bien été enregistré"
    else
      render 'order/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
