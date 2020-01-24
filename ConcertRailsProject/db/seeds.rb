Location.destroy_all
Artist.destroy_all
Venue.destroy_all
Performance.destroy_all
Concert.destroy_all


#locations

nyc = Location.create(name: 'New York City')
dc = Location.create(name: 'Washington D.C.')

#artists

tool = Artist.create(genre: 'Rock', name: 'Tool', bio: 'Is a band')
beatles = Artist.create(genre: 'Rock', name: 'The Beatles', bio: 'Is a Liverpool band')

#venues

anthem = Venue.create(name: 'The Anthem', capacity: 500, location_id: 1)
msg = Venue.create(name: 'Madison Square Garden', capacity: 10, location_id: nyc.id)
capital1 = Venue.create(name: 'Capital One', capacity: 100000, location_id: dc.id)

#concerts

toolconcert = Concert.create({
    :name      => "Tool Tour 2020",
    :venue_id  => msg.id,
    :date    => DateTime.new(2020,9,1,19)
})

beatlesconcert = Concert.create({
    :name      => "Beatle Reunion 2020",
    :venue_id  => capital1.id,
    :date    => DateTime.new(2020,10,1,19)
})

beatlesconcert2 = Concert.create({
    :name      => "Beatle Without Ringo 2020",
    :venue_id  => msg.id,
    :date    => DateTime.new(2019,10,1,19)
})

beatlesconcert3 = Concert.create([{
:name      => "Hologram Lennon 2020",
:venue_id  => anthem.id,
:date    => DateTime.new(2020,1,24,19)
}])

toolconcert3 = Concert.create([{
    :name      => "Tool Rides Again",
    :venue_id  => capital1.id,
    :date    => DateTime.new(2020,1,24,19)
    }])
#Performances

toolatcapital1 = Performance.create(artist_id: tool.id, concert_id: toolconcert.id, headliner: true)
beatlesatcapital1 = Performance.create(artist_id: beatles.id, concert_id: beatlesconcert.id, headliner: false)
beatlesatmsg = Performance.create(artist_id: beatles.id, concert_id: beatlesconcert2.id, headliner: true)
beatlesatc1 = Performance.create(artist_id: beatles.id, concert_id: beatlesconcert.id, headliner: true)
beatlesatc12 = Performance.create(artist_id: beatles.id, concert_id: 4, headliner: true)
toolridesagain = Performance.create(artist_id: tool.id, concert_id: 5, headliner: true)
