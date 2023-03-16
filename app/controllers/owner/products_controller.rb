class Owner::ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.where(user: current_user)
  end

  def show
    @reviews = Review.joins(order: { sale: :product }).where(products: { id: @product.id })
    @qr_code = RQRCode::QRCode.new(@product.qr_code)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to owner_product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :store_price, :reference, :weight, :eco_score, :brand, :photo)
  end
end
