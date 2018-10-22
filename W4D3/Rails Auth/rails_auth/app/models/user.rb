class User < ApplicationRecord

  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :username, presence: true, uniquess: true
  validates :password, length: { minimum: 6, allow_nil: true }

  # before_validation :ensure_session_token


  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  # def self.generate_session_token
  #   SecureRandom::urlsafe_base64
  # end
  #
  # def reset_session_token!
  #   self.session_token = self.class.generate_session_token
  #
  # end
  #
  # def ensure_session_token
  # end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end



end
