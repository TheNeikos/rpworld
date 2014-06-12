class Character < ActiveRecord::Base
    belongs_to :user
    has_many :moods, :dependent => :destroy
    accepts_nested_attributes_for :moods
    validates :name, presence: true
end
