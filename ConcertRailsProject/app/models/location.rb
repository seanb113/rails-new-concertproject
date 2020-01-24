class Location < ApplicationRecord
    has_many :venues
    has_many :concerts, through: :venues

    def todays_concerts
        self.concerts.select do |c|
            c.date.today?
        end
    end
end
