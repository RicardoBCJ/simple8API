class HelpRequest < ApplicationRecord
    belongs_to :user
    has_one :conversation
    validates :user_id,  presence: true
    validates :description, length: { maximum: 300,
        too_long: "%{count} characters is the maximum allowed"}

    geocoded_by :address
    after_validation :geocode
end
