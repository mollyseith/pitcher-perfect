class BeersController < ApplicationController
  before_action :set_beer, only: [:show]

  def index
    @beers = Beer.all
  end

  def show
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end
end
