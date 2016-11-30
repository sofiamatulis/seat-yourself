# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 Restaurant.create(name: 'Italian food', address: '1234 Food Street', phone: '416 123 1234', capacity: 50, opening_hours: '1100', closing_hours: '2000', website: 'www.italianfood.com')

 User.create(name: 'Natalie', phone: '416-787-9898', email: 'natalie@gmail.com', password: 'poop', password_confirmation: 'poop')
