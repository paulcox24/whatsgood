# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['music','comedy','movies_film','art','attractions','singles_social','sports']

User.create(first_name: 'Boss',
            email: 'boss@email.com',
            password: 'password',
            password_confirmation: 'password',
            description: 'Im an admin',
            address: 'Salt Lake City',
            is_admin: true)

# categories.each do |category|
#   Category.create(name: category)
# end

