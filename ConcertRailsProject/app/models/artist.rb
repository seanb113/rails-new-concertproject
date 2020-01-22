class Artist < ApplicationRecord
    has_many :concerts, through: :performances
    has_many :performances
    belongs_to :favoriteArtists
    has_many :users, through: :favoriteArtists
end
