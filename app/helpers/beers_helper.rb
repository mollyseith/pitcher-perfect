module BeersHelper
  def display_best_beers
    Beer.best_beers
  end

  def display_most_reviewed_beer
    Beer.most_reviews
  end
end
