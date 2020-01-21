class Artist < ApplicationRecord
    has_many :concerts, through: :performances
    has_many :performances
end
