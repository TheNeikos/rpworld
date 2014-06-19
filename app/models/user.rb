class User < ActiveRecord::Base
  has_secure_password

  has_many :replies
  has_many :characters

  has_attached_file :avatar :styles => {small: "100x100>", medium: "300x300>", large:"600x600>"}

  validates :email, :uniqueness => { case_sensitive: false }
  validates :displayname, :uniqueness => { case_sensitive: false },
    :format => { with: /\A[0-9a-zA-Z_-]+\z/ }
  
  #Avatar Validations 
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :image, presence: true

  def verified?
    self.verified == 1
    !self.displayname.nil?
  end

  def admin?
    false
  end

end
