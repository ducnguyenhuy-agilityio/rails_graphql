Types::UserType = GraphQL::ObjectType.define do
  interfaces [Types::ActiveRecordInterface]
  name 'User'

  field :email, !types.String
  field :name, !types.String
  field :password_digest, !types.String

  field :rentals, !types[Types::RentalType] do
    preload :rentals
    resolve -> (obj, args, ctx) { obj.rentals }
  end
  field :bookings, !types[Types::BookingType] do
    preload :bookings
    resolve -> (obj, args, ctx) { obj.bookings }
  end
end
