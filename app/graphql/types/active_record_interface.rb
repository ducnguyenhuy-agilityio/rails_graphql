Types::ActiveRecordInterface = GraphQL::InterfaceType.define do
  name 'ActiveRecord'

  field :id, types.Int
  field :created_at, Types::DateTimeType
  field :updated_at, Types::DateTimeType
end
