class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show]

  def index
    @breweries = Brewery.all
    if params.include?(:object_name)
      @breweries = Brewery.where('name LIKE ?', "%#{params[:object_name]}%")
    else
      @breweries = Brewery.all
    end

    @breweries = @breweries.paginate(page: params[:page], per_page: 50)

    @best_brewery = Brewery.highest_rated
    @worst_brewery = Brewery.lowest_rated
    @most_beers = Brewery.most_beers
  end

  def show
  end

  private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end
end
