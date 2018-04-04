Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :rentals, !types[Types::RentalType] do
    description ""
    argument :limit, types.Int, default_value: 20, prepare: -> (limit) { [limit, 30].min }
    argument :sort_by, types.String
    argument :direction, types.String, default_value: :asc
    resolve ->(obj, args, ctx) {
      OrderedRentalsQuery.new({ sort_by: args[:sort_by], direction: args[:direction] }).all.limit(args[:limit])
    }
  end

  field :featured_rentals, !types[Types::RentalType] do
    argument :limit, types.Int, default_value: 20, prepare: -> (limit) { [limit, 30].min }
    argument :sort_by, types.String
    argument :direction, types.String, default_value: :asc
    # guard ->(obj, args, ctx) { !ctx[:current_user].blank? }
    resolve ->(obj, args, ctx) {
      # if ctx[:current_user].blank?
      #   raise GraphQL::ExecutionError.new("Authentication required")
      # end

      # if ctx[:current_user] == -1
      #   raise GraphQL::ExecutionError.new("Invalid token")
      # end

      FeaturedRentalsQuery.new(OrderedRentalsQuery.new({ sort_by: args[:sort_by], direction: args[:direction] }).all).all.limit(args[:limit])
    }
  end

  field :users, !types[Types::UserType] do
    description ""
    resolve ->(obj, args, ctx) {
      User.all
    }
  end

  field :bookings, !types[Types::BookingType] do
    resolve ->(obj, args, ctx) {
      Booking.all
    }
  end
end
