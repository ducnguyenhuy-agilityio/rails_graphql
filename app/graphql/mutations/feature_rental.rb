class Mutations::FeatureRental < GraphQL::Function

  argument :rental_id, types.Int

  type Types::RentalType

  def call(obj, args, ctx)
    Resolvers::RescueFrom.new(method(:feature_rental)).call(obj, args, ctx)
  end

  private
  def feature_rental(obj, args, ctx)
    rental_id = args[:rental_id]

    rental = Rental.find(rental_id)

    rental.update_attributes({ featured: true, views_count: (rental.views_count || 0) + 60 })

    rental
  end
end
