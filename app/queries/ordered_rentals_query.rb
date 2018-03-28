class OrderedRentalsQuery
  SORT_OPTIONS = %W(by_created_at by_updated_at).freeze

  def initialize(params={}, relation = Rental)
    @params = params
    @relation = relation
  end

  def all
    @relation.public_send(sort_by, direction) # call scope sort_by and pass direction param
  end

  private
  def sort_by
    @params[:sort_by].presence_in(SORT_OPTIONS) || :by_created_at
  end

  def direction
    @params[:direction] == 'asc' ? :asc : :desc
  end
end
