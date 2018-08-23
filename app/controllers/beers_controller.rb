class BeersController < ApplicationController
  before_action :set_beer, only: [:show]

  def index
    # If a user has used the search bar (params[:beer_name]), then we will use
    # their search to limit the beers displayed
    @beers = Beer.all
    if params.include?(:object_name)
      @beers = Beer.where('name LIKE ?', "%#{params[:object_name]}%")
    else
      @beers = Beer.all
    end
    @beers = @beers.paginate(page: params[:page], per_page: 50)
  end

  def show
    @avg = @beer.average_rating
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end
end
