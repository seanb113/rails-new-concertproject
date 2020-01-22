class Venue < ApplicationRecord
    has_many :concerts
    belongs_to :favoriteVenues
    has_many :users, through: :favoriteVenues
end
