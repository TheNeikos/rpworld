class Reply < ActiveRecord::Base
    belongs_to :user
    belongs_to :character
    belongs_to :place

    validates :user, presence: true
    validates :place, presence: true
    validates :body, presence: true

    validate :character_belongs_to_user

    private
    def character_belongs_to_user
        if self.character_id.present?
            unless self.character.present?
                errors[:character_id] << "This character does not exist."
            else
                unless self.character.user.id == self.user.id
                    errors[:character_id] << "You cannot reply as someone else's character."
                end
            end
        end
    end
end
