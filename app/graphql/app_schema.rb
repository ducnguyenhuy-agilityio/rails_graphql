AppSchema = GraphQL::Schema.define do
  use GraphQL::Batch
  use GraphQL::Guard.new(
    # Returns an error in the response
    not_authorized: ->(type, field) { GraphQL::ExecutionError.new("Not authorized to access.") },
    policy_object: GraphqlPolicy
  )

  enable_preloading

  mutation(Types::MutationType)
  query(Types::QueryType)

end

GraphQL::Errors.configure(AppSchema) do
  rescue_from ActiveRecord::RecordNotFound do |exception|
    GraphQL::ExecutionError.new("Record not found")
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    GraphQL::ExecutionError.new(exception.record.errors.full_messages.join("\n"))
  end

  rescue_from StandardError do |exception|
    GraphQL::ExecutionError.new(exception.message)
  end

  # rescue_from GraphQL::Guard::NotAuthorizedError do |exception|
  #   GraphQL::ExecutionError.new("Error here")
  # end

  # rescue_from CustomError do |exception, object, arguments, context|
  #   error = GraphQL::ExecutionError.new("Error found!")
  #   firstError.path = content.path + ["myError"]
  #   context.add_error(firstError)
  # end
end
