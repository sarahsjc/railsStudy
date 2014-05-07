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
  end
end
