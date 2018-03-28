class Mutations::SignInUser < GraphQL::Function
  # define the arguments this field will receive
  argument :email, !Types::AuthProviderEmailInput

  # define what this field will return
  type Types::AuthenticateType

  # resolve the field's response
  def call(obj, args, ctx)
    Resolvers::RescueFrom.new(method(:sign_in_user)).call(obj, args, ctx)
  end

  private
  def sign_in_user(obj, args, ctx)
    input = args[:email]

    return unless input

    user = User.find_by(email: input[:email])
    return response(nil, nil, [{ email:['User not found!'] }]) unless user
    return response(nil, nil, [{ password:['Invalid password!'] }]) unless user.authenticate(input[:password])

    response(user, AuthToken.token(user))
  end

  def response(user, token, errors = [])
    OpenStruct.new({
      user: user,
      token: token,
      errors: errors
    })
  end
end
