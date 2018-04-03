class FeaturedRentalsQuery < FeaturedQuery
  VIEWS_COUNT = 200

  def views_count_condition
    "views_count > #{VIEWS_COUNT}"
  end
end
