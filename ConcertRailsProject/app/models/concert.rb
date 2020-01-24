class Concert < ApplicationRecord
  belongs_to :venue
  has_one :location, through: :venue
  has_many :upcoming_concerts
  has_many :performances
  has_many :artists, through: :performances
  has_many :users, through: :upcoming_concerts
  has_many :reviews
  has_many :users, through: :reviews
  
  def sortable_name
    self.name.sub(/^(the|a|an)\s+/i, '')
  end

  def headliner
    self.performances.find do |p|
      p.headliner == true
    end
  end

  def support_acts
    self.performances.find do |p| 
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

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
