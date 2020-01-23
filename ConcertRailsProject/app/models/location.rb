class Location < ApplicationRecord
    has_many :venues
    has_many :concerts, through: :venues
end
