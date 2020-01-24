class User < ApplicationRecord
    has_many :reviews
    has_many :concerts, through: :reviews
    has_many :favorite_artists
    has_many :artists, through: :favorite_artists
    has_many :favorite_venues
    has_many :venues, through: :favorite_venues
    has_many :upcoming_concerts
    has_many :concerts, through: :upcoming_concerts
    has_many :reviews
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: true }
    validates :name, presence: true, length: { minimum: 2 }
    validates :age, presence: true, numericality: { greater_than: 17 }
    validates :password, presence: true, length: { :within => 8..20 }

def favorite_artist(artist)
    FavoriteArtist.find_or_create_by(artist_id: artist.id, user_id: self.id)
end

def unfavorite_artist(artist)
    @favorited_artist = FavoriteArtist.where(artist_id: artist.id, user_id: self.id)
    if @favorited_artist.exists?
        @favorited_artist.destroy_all
    artist.reload
    end
end

def favorite_venue(venue)
    FavoriteVenue.find_or_create_by(venue_id: venue.id, user_id: self.id)
end

def unfavorite_venue(venue)
    @favorited_venue = FavoriteVenue.where(venue_id: venue.id, user_id: self.id)
    if @favorited_venue.exists?
        @favortied_venue.destroy_all
    venue.reload
    end
end

def upcoming_concert(concert)
    UpcomingConcert.find_or_create_by(concert_id: concert.id, user_id: self.id)
end

def not_attending(concert)
    @rsvp = upcoming_concerts.where(concert_id: concert.id, user_id: self.id)
    if @rsvp.exists?
        @rsvp.destroy_all
    concert.reload
    end
end

def log_in(session)
    session[:user_id] = self.id
end

def past_concerts
    self.concerts.select {|c| c.date.past?}
end

def rsvped?(concert)
    self.upcoming_concerts.each do |u|
      u.concert_id == concert
    end
end

def favorited_venue?(venue)
    self.favorite_venues.each do |v|
        v.id == venue
      end
end

def favorited_artist?(artist)
    self.favorite_artists.each do |a|
        a.id == artist
      end
end


end
