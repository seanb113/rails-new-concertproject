class Venue < ApplicationRecord
    has_many :concerts
    has_many :favorite_venues
    has_many :users, through: :favorite_venues
end
