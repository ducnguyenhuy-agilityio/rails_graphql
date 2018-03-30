class Resolvers::RescueFrom
  def initialize(resolve_func)
    @resolve_func = resolve_func
  end

  def call(obj, args, ctx)
    @resolve_func.call(obj, args, ctx)
  # rescue ActiveRecord::RecordNotFound => err
  #   GraphQL::ExecutionError.new("Record not found!", options: { status: false, code: 404 })
  # rescue ActiveRecord::RecordInvalid => err
  #   message = err.record.errors.full_messages.join("\n")
  #   GraphQL::ExecutionError.new("Validation failed: #{message}", options: { status: false, code: 500 })
  # rescue StandardError => err
  #   GraphQL::ExecutionError.new("Unexception error: #{err.message}", options: { status: false, code: 500 })
  end
end
