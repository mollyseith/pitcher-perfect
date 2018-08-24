class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]

  def index
    @venues = Venue.all

    @best_venue = Venue.highest_rated
    @worst_venue = Venue.lowest_rated
    @most_beers = Venue.most_beers
  end

  def show
  end

  private
  def set_venue
    @venue = Venue.find(params[:id])
  end

end
