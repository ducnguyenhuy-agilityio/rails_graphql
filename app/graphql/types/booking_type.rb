Types::BookingType = GraphQL::ObjectType.define do
  name "Booking"

  field :id, !types.ID
  field :start_date, !types.String
  field :stop_date, !types.String
  field :review_score, types.Int
  field :review_comments, types.String
  field :reviewed_at, types.String

  field :rental, Types::RentalType do
    preload :rental
    resolve -> (obj, args, ctx) { obj.rental }
  end
  field :guest, Types::UserType do
    preload :user
    resolve -> (obj, args, ctx) { obj.user }
  end

  field :errors, types[types.String] do
    resolve -> (obj, args, ctx) { obj.errors.full_messages }
  end
end
