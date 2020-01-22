class Artist < ApplicationRecord
    has_many :concerts, through: :performances
    has_many :performances
    belongs_to :favorite_artists, optional: true
    has_many :favorited_by, through: :favorite_artists, source: :users
end
