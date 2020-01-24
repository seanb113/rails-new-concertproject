class FavoriteVenue < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates_uniqueness_of :user_id, :scope => [:venue_id]
end
