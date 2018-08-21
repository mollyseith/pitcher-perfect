class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show]

  def index
    @breweries = Brewery.all
    if params.include?(:object_name)
      @breweries = Brewery.where('name LIKE ?', "%#{params[:object_name]}%")
    else
      @breweries = Brewery.all
    end
  end

  def show
  end

  private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end
end
