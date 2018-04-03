Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signInUser, function: Mutations::SignInUser.new
  field :bookRental, function: Mutations::BookRental.new
  field :featureRental, function: Mutations::FeatureRental.new
end
