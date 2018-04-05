require 'rails_helper'
require 'graphql/guard/testing'

RSpec.describe "GraphQL Guard" do
  it 'Authorization for rentals API' do
    rentals = Types::QueryType.field_with_guard('rentals', GraphqlPolicy)
    result = rentals.guard(obj, args, ctx)
    expect(result).to eq(true)
  end
end
