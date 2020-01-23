class Concert < ApplicationRecord
  belongs_to :venue
  has_many :upcoming_concerts
  has_many :performances
  has_many :artists, through: :performances
  has_many :users, through: :upcoming_concerts
  has_many :reviews
  has_many :users, through: :reviews
  

  def headliner
    self.performances.find do |p|
      p.headliner == true
    end
  end

  def support_acts
    self.performances.select do |p|
      if p.headliner == false
      return p.artist.name
      end
    end
  end

  def location
    self.venue.location
  end

  def happened?
    self.date.past?
  end

  def upcoming
    !Concert.all.date.past?
  end

end