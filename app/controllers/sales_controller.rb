class SalesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @sales = Sale.global_search(params[:query])
    else
      @sales = Sale.all
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
