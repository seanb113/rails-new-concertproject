class Concert < ApplicationRecord
  belongs_to :venue
  has_many :performances
  has_many :artists, through: :performances

  def headliner
    self.performances.select do |p|
      if p.headliner == true
      return p.artist.name
      end
    end
  end

  def support_acts
    self.performances.select do |p|
      if p.headliner == false
      return p.artist.name
      end
    end
  end
end