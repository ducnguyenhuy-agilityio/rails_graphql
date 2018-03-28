

puts '--------- Using Dig Function ---------'
params = { user: { address: { somewhere_deep: 1 } } }

if params[:user] && params[:user][:address] && params[:user][:address][:somewhere_deep]
  puts 'We used a batch of conditions.'
end

if params.dig(:user, :address, :somewhere_deep)
  puts 'We used the dig function and same result.'
end


puts '--------- Using Presence_in Function ---------'
sort_options = [:by_date, :by_title, :by_author]
sort_param = :by_title
sort_default = :by_date

sort = (sort_options.include?(sort_param) && sort_param) || sort_default
puts "Not using presence_in: #{sort}"

# sort = sort_param.presence_in(sort_options) || sort_default
# puts "Using presence_in and same result: #{sort}"
