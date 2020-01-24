class Venue < ApplicationRecord
    belongs_to :location
    has_many :concerts
    has_many :favorite_venues
    has_many :users, through: :favorite_venues

    def sortable_name
        self.name.sub(/^(the|a|an)\s+/i, '')
    end
end
