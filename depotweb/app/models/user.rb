class User < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains
  #attr_accessor :password, :password_confirmation
  has_secure_password

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end
