if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = -> (ctx) { "bearer #{ENV['JWT_TOKEN']}" }
end
