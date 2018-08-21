class BeersController < ApplicationController
  before_action :set_beer, only: [:show]

  def index
    # If a user has used the search bar (params[:beer_name]), then we will use
    # their search to limit the beers displayed
    if params.include?(:beer_name)
      @beers = Beer.where('name LIKE ?', "%#{params[:beer_name]}%")
    else
      @beers = Beer.all
    end
  end

  def show
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end
end
