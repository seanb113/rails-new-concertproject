class Review < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  has_one :venue, through: :concert
  has_many :artists, through: :concert
  validates_uniqueness_of :user_id, :scope => :concert_id
end

def has_reviewed?(concert)
  self.reviews.concert.exists?
end
