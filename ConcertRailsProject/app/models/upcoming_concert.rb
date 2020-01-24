class UpcomingConcert < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  validates_uniqueness_of :user_id, :scope => [:concert_id]

end
