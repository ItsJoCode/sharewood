class SalesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @sales = Sale.global_search(params[:query])
    else
      @sales = Sale.all
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
