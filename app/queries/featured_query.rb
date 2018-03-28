class FeaturedQuery
  def initialize(relation = Rental)
    @relation = relation
  end

  def all
    @relation.where(featured: true)
  end
end
