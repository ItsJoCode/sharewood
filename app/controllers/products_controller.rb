class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @reviews = Review.joins(order: { sale: :product }).where(products: { id: @product.id })
  end
end
