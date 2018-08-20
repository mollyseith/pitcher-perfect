class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show]

  def index
    @breweries = Brewery.all
  end

  def show
  end

  private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end
end
