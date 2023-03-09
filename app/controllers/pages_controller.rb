class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home propos_pellet cgv cookies_policy informations_personnelles]

  def home
  end

  def propos_pellet
  end

  def cgv
  end

  def informations_personnelles
  end

  def cookies_policy
  end

end
