class Review < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  has_one :venue, through: :concerts
  has_many :artists, through: :concerts
  validates_uniqueness_of :user_id, :scope => [:concert_id]
  validates :title, presence: true
  validates :content, presence: true
end
