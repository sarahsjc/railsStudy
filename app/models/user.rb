class User < ActiveRecord::Base
  validates :login, :presence =>true

  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password(pass)
  end

  def generate_password(pass)
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.salt, self.hashed_password =
        salt, Digest::SHA256.hexdigest(pass + salt)

  end
end
