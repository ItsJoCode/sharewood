class CreatorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @creators = Creator.all
  end

  def show
    @creator = Creator.find(params[:id])
  end
end
