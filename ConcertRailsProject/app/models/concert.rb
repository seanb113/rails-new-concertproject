class Concert < ApplicationRecord
  belongs_to :venue
  has_many :upcoming_concerts
  has_many :performances
  has_many :artists, through: :performances
  has_many :users, through: :upcoming_concerts
  has_many :reviews
  accepts_nested_attributes_for :reviews
  

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

  private

  def concert_params
    params.require(:concert).permit(
      :name, :venue_id, :date,
      reviews_attributes: [ :title, :content ]
    )
  end

end