class Venue < ApplicationRecord
    has_many :concerts
    belongs_to :favorite_venues, optional: true
    has_many :users, through: :favorite_venues
end
