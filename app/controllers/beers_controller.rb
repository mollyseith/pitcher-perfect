class BeersController < ApplicationController
  before_action :set_beer, only: [:show]

  def index
    @beers = Beer.all
    require 'csv'

    # CSV.open('beer.csv', 'r', ';') do |row|
    #   puts row

    CSV.foreach("beer.utf8.csv", headers: true) {|row| puts "#{row[2]} " }
  end

  def show
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end
end
