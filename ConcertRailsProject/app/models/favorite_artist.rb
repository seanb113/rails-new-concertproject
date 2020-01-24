class FavoriteArtist < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  validates_uniqueness_of :user_id, :scope => [:artist_id]
end
