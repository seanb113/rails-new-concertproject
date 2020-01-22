class Concert < ApplicationRecord
  belongs_to :venue
  has_many :performances
  has_many :artists, through: :performances

  def headliner
    self.performances.find do |p|
      p.headliner == true
    end.artist.name
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

end