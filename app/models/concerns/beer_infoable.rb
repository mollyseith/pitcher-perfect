module BeerInfoable
  module ClassMethods
    # sorts all instances according to the average_rating for all of an
    # instance's beers
    def order_by_avg_beer_rating
      instances_with_reviews.sort_by do |b|
        b.avg_beer_rating
      end
    end

    def order_by_beers_count
      all.sort_by do |s|
        s.beers_count
      end
    end

    def instances_with_reviews
      all.select do |b|
        b.avg_beer_rating.class != String
      end
    end

    # selects the instance with the highest average_beer_rating from the
    # instances ordered by their average beer rating
    def highest_rated
      order_by_avg_beer_rating[-1]
    end

    # selects the instance with the lowest average_beer_rating from the
    # instances ordered by their average beer rating
    def lowest_rated
      order_by_avg_beer_rating[0]
    end

    def most_beers
      order_by_beers_count.last
    end
  end

  module InstanceMethods
    # selects all of an instance's beers which have an associated review
    def reviewed_beers
      beers.select do |beer|
        beer.reviews_count > 0
      end
    end

    # calculates the average_rating for all of an instance's beers which have
    # been reviewed
    def avg_beer_rating
      if !(reviewed_beers.empty?)
        total = reviewed_beers.inject(0) do |s, b|
          s + b.average_rating
        end
        total / reviewed_beers.count
      else
        'No beers have been reviewed'
      end
    end

    def beers_count
      beers.count
    end

    # counts the total number of reviews associated with a brewery's beers
    def reviewed_beers_count
      review_count = beers.inject(0) do |total, beer|
        total + beer.reviews_count
      end
      review_count
    end

    # sorts a brewery's beers by their average_rating
    def order_beers_by_avg_rating
      reviewed_beers.sort_by do |beer|
        beer.average_rating
      end
    end

    # selects the beer with the highest average_rating from the beers ordered by
    # their average rating
    def best_beer
      order_beers_by_avg_rating[-1]
    end

    # selects the beer with the lowest average_rating from the beers ordered by
    # their average rating
    def worst_beer
      order_beers_by_avg_rating[0]
    end
  end
end
