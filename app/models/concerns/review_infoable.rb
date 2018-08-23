module ReviewInfoable
  module ClassMethods
    # orders all instances according to their reviews_count
    def order_by_reviews_count
      all.sort_by do |i|
        i.reviews_count
      end
    end

    # selects the instance with the highest reviews_count from the instances
    # ordered by their reviews_count
    def most_reviews
      order_by_reviews_count[-1]
    end
  end

  module InstanceMethods
    def reviews_count
      reviews.count
    end
  end
end
