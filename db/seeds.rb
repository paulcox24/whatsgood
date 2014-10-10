# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['music','comedy','movies_film','art','attractions','singles_social','sports']

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

categories.each do |category|
  Category.create(name: category)
end

