require 'rails_helper'
require 'graphql/guard/testing'

RSpec.describe "GraphQL Guard" do
  before do
    @user = create(:user)
  end

  it 'Authorization for rentals API' do
    rentals = Types::QueryType.field_with_guard('rentals', GraphqlPolicy)
    obj = {}
    arguments = {}
    context = { current_user: @user }
    result = rentals.guard(obj, arguments, context)
    expect(result).to eq(true)
  end
end
