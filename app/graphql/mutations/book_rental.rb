class Mutations::BookRental < GraphQL::Function
  argument :rental_id, !types.Int
  argument :start_date, !Types::DateTimeType
  argument :stop_date, !Types::DateTimeType
  argument :guests, !types.Int

  type Types::BookingType

  def call(obj, args, ctx)
    Resolvers::RescueFrom.new(method(:book_rental)).call(obj, args, ctx)
  end

  private

  def book_rental(obj, args, ctx)
    # Raise exception if no user is present
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    if ctx[:current_user] == -1
      raise GraphQL::ExecutionError.new("Invalid token")
    end

    rental = Rental.find(args[:rental_id])

    # booking = rental.bookings.create!({
    #   user: ctx[:current_user],
    #   start_date: args[:start_date],
    #   stop_date: args[:stop_date],
    #   guests: args[:guests]
    # })
    booking = BookRentalHandler.execute({
      start_date: args[:start_date],
      stop_date: args[:stop_date],
      guests: args[:guests]
    }, ctx[:current_user].id)

    booking
  end
end
