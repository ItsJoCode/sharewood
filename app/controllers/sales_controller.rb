class SalesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @sales = Sale.all

    # The `geocoded` scope filters only sales with coordinates
    @markers = @sales.geocoded.map do |sale|
      {
        lat: sale.latitude,
        lng: sale.longitude
      }
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
