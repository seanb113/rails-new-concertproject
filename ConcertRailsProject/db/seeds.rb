# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nyc = Location.create(name: 'New York City')
dc = Location.create(name: 'Washington D.C.')
tool = Artist.create(genre: 'Rock', name: 'Tool', bio: 'Is a band')
capital1 = Venue.create(name: 'Capital One', capacity: 100000, location_id: 2)
toolconcert = Concert.create([{
    :name      => "Tool Tour 2020",
    :venue_id  => 1,
    :date    => DateTime.new(2020,9,1,19)
  }])

beatles = Artist.create(genre: 'Rock', name: 'The Beatles', bio: 'Is a british band')

toolatcapital1 = Performance.create(artist_id: 1, concert_id: 1, headliner: true)
beatlesatcapital1 = Performance.create(artist_id: 2, concert_id: 1, headliner: false)



msg = Venue.create(name: 'Madison Square Garden', capacity: 10, location_id: 1)
beatlesconcert = Concert.create([{
    :name      => "Beatle Reunion 2020",
    :venue_id  => 2,
    :date    => DateTime.new(2020,10,1,19)
    }])
    
    beatlesatmsg = Performance.create(artist_id: 2, concert_id: 2, headliner: true)
    beatlesconcert2 = Concert.create([{
      :name      => "Beatle Without Ringo 2020",
      :venue_id  => 1,
      :date    => DateTime.new(2019,10,1,19)
      }])
      
beatlesatc1 = Performance.create(artist_id: 2, concert_id: 3, headliner: true)

anthem = Venue.create(name: 'The Anthem', capacity: 500, location_id: 1)

beatlesconcert3 = Concert.create([{
    :name      => "Hologram Lennon 2020",
    :venue_id  => 3,
    :date    => DateTime.new(2020,1,24,19)
    }])

beatlesatc12 = Performance.create(artist_id: 2, concert_id: 4, headliner: true)


      