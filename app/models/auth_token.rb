class AuthToken
  def self.key
    Rails.application.secrets.secret_key_base
  end

  def self.token(user)
    payload = {user_id: user.id}
    JsonWebToken.sign(payload, key: key)
  end

  def self.verify(token)
    result = JsonWebToken.verify(token, key: key) rescue -1 # (Duc updated this code) token is not correct format
    return result if result == -1
    return nil if result[:error]
    User.find_by(id: result[:ok][:user_id])
  end
end
