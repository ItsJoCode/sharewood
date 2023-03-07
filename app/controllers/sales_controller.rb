class SalesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
