# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genres = ['Comedy','Action','Drama']

5.times do |counter|
  Event.create(
    name: "#{ (counter + 1).ordinalize } event", 
    description: "This is the description for #{ (counter + 1).ordinalize } event", 
    event_type: 'Movie',
    genre: genres.sample)
end

5.times do |counter|
  Venue.create(
    name: "#{ (counter + 1).ordinalize } Venue", 
    description: "This is the description for #{ (counter + 1).ordinalize } venue", 
    venue_type: 'Movie theater')
end

5.times do |counter|
  Act.create(
    name: "#{ (counter + 1).ordinalize } Act", 
    description: "This is the description for #{ (counter + 1).ordinalize } Act")
end