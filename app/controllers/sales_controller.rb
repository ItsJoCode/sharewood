class SalesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if current_user&.customer?
      redirect_to customer_sales_path and return
    elsif current_user&.owner?
      redirect_to owner_sales_path and return
    end
    if params[:query].present?
      @sales = Sale.global_search(params[:query])
    else
      @sales = Sale.all
    end
    if current_user
      @markers = @sales.geocoded.map do |sale|
        {
          lat: sale.latitude,
          lng: sale.longitude,
          marker_html: '<i class="fa-solid fa-location-dot"></i>'
        }
      end
      # current_user marker
      @markers.unshift(
        {
          lat: current_user.latitude,
          lng: current_user.longitude,
          marker_html: '<i class="fa-solid fa-house-user"></i>'
        }
      )
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "sales/list", locals: { sales: @sales }, formats: [:html] }
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
