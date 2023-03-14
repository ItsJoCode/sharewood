class SalesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if current_user&.customer?
      redirect_to customer_sales_path and return
    # elsif current_user&.owner?
    #   redirect_to sales_path and return
    end

    @sales = Sale.all
    @sales = @sales.global_search(params[:query]) if params[:query].present?
    @markers = current_user.near_markers_for(@sales) if current_user

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "sales/list", locals: { sales: @sales }, formats: [:html] }
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
