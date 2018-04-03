class FeaturedQuery
  VIEWS_COUNT = 100

  def initialize(relation)
    @relation = relation
  end

  def all
    @relation.where(featured: true).where(views_count_condition)
  end

  def views_count_condition
    "views_count > #{VIEWS_COUNT}"
  end
end
