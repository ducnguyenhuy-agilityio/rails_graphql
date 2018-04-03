AppSchema = GraphQL::Schema.define do
  use GraphQL::Batch

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
    puts exception.message
    GraphQL::ExecutionError.new("Please try to execute the query for this field later")
  end

  # rescue_from CustomError do |exception, object, arguments, context|
  #   error = GraphQL::ExecutionError.new("Error found!")
  #   firstError.path = content.path + ["myError"]
  #   context.add_error(firstError)
  # end
end
