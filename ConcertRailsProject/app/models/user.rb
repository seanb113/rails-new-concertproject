class User < ApplicationRecord
    has_many :reviews
    has_many :concerts, through: :reviews
    validates :username, presence: true, uniqueness: {case_sensitive: false}
    has_many :favoriteArtists
    has_many :artists, through: :favoriteArtists
    has_many :favoriteVenues
    has_many :venues, through: :favoriteVenues
    has_many :upcomingConcerts
    has_many :concerts, through: :upcomingConcerts
    has_secure_password

def favorite_artist(artist)
    favoriteArtists.find_or_create_by(artist: artist)
end

def unfavorite_artist(artist)
    favoriteArtists.where(artist: artist).destroy_all
    artist.reload
end

def favorite_venue(venue)
    favoriteVenues.find_or_create_by(venue: venue)
end

def unfavorite_venue(venue)
    favoriteVenues.where(venue: venue).destroy_all
    venue.reload
end

def upcoming_concert(concert)
    upcomingConcert.find_or_create_by(concert: concert)
end

def not_attending(concert)
    upcomingConcert.where(concert: concert).destroy_all
    concert.reload
end

end
