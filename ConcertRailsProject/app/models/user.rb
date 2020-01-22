class User < ApplicationRecord
    has_many :reviews
    has_many :concerts, through: :reviews
    has_many :favorite_artists
    has_many :artists, through: :favorite_artists
    has_many :favorite_venues
    has_many :venues, through: :favorite_venues
    has_many :upcoming_concerts
    has_many :concerts, through: :upcoming_concerts
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: true }
    validates :name, presence: true, length: { minimum: 2 }
    validates :age, presence: true, inclusion: { in: 18..99}
    validates :password, presence: true, length: { :within => 8..40 }

def favorite_artist(artist)
    FavoriteArtist.find_or_create_by(artist_id: artist.id, user_id: self.id)
end

def unfavorite_artist(artist)
    FavoriteArtist.where(artist_id: artist.id, user_id: self.id).destroy_all
    artist.reload
end

def favorite_venue(venue)
    FavoriteVenue.find_or_create_by(venue_id: venue.id, user_id: self.id)
end

def unfavorite_venue(venue)
    favorite_venues.where(venue_id: venue.id, user_id: self.id).destroy_all
    venue.reload
end

def upcoming_concert(concert)
    UpcomingConcert.find_or_create_by(concert_id: concert.id, user_id: user.id)
end

def not_attending(concert)
    upcoming_concerts.where(concert_id: concert.id, user_id: user.id).destroy_all
    concert.reload
end

def log_in(session)
    session[:user_id] = self.id
end

end
