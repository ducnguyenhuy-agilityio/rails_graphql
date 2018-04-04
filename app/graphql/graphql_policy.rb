class GraphqlPolicy
  RULES = {
    Types::QueryType => {
      featured_rentals: ->(obj, args, ctx) { !ctx[:current_user].blank? },
      rentals: ->(obj, args, ctx) { !ctx[:current_user].blank? }
    },
    Types::MutationType => {
      bookRental: ->(obj, args, ctx) { !ctx[:current_user].blank? },
      featureRental: ->(obj, args, ctx) { !ctx[:current_user].blank? }
    }
  }

  def self.guard(type, field)
    RULES.dig(type, field)
  end
end
