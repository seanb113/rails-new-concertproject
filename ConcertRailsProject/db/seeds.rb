# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tool = Artist.create(genre: 'Rock', name: 'Tool', bio: 'Is a band')
capital1 = Venue.create(name: 'Capital One', capacity: 100000, location: 'Washington, D.C.')
toolconcert = Concert.create([{
    :name      => "Tool Tour 2020",
    :venue_id  => 1,
    :date    => DateTime.new(2020,9,1,19)
  }])