class Review < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  has_one :venue, through: :concert
  has_many :artists, through: :concert
end
