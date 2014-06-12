class Place < ActiveRecord::Base
    belongs_to :region
    belongs_to :user
    has_many :replies

    validates :user, presence: true
    validates :region, presence: true
    validates :name, presence: true
    validates :description, presence: true
end
