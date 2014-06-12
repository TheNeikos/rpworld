class Mood < ActiveRecord::Base
  belongs_to :character, :inverse_of => :moods
  has_attached_file :picture, styles: {small: "100x100>",
                                       medium: "300x300>",
                                       large:"600x600>"}
  validates_attachment_content_type :picture,
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
