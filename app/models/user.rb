class User < ActiveRecord::Base
  has_secure_password

  has_many :replies
  has_many :characters

  validates :email, :uniqueness => { case_sensitive: false }
  validates :displayname, :uniqueness => { case_sensitive: false },
    :format => { with: /\A[0-9a-zA-Z_-]+\z/ }

  def verified?
    self.verified == 1
    !self.displayname.nil?
  end

  def admin?
    false
  end

end
