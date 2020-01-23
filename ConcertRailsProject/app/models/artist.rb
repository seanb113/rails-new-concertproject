class Artist < ApplicationRecord
    has_many :concerts, through: :performances
    has_many :performances
    has_many :favorite_artists
    has_many :users, through: :favorite_artists
end
