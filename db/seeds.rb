# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Booking.destroy_all
Offer.destroy_all
User.destroy_all



puts 'creating 50 fake users...'
50.times do
  user = User.new(
    first_name: Faker::Movies::StarWars.character,
    last_name: Faker::Creature::Animal.name,
    address: Faker::Address.street_name,
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save
end

# brianna = User.create!(first_name: 'Brianna', last_name: 'London', address: '19 Rue des Petites Champ, Paris France, 75001', email: 'brianna@gmail.com', password:'123456')
# puts User.count


language = ['French', 'English', 'Spanish', 'Chinese', 'Japanese', 'German', 'Arabic']
level = ['native', 'advanced', 'intermediate']
date = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
duration = ['1 hour', '2 hour', '30 minutes']

10.times do
  offer = Offer.new(
    user: User.all.sample,
    language: language.sample,
    level: level.sample,
    date: date.sample,

    duration: duration.sample,
    address: Faker::Address.street_name,

  )
  offer.save!
  sleep(1)
end
puts Offer.all

# Offer.create!(user: brianna, language: 'english', level: 'native', date: 'Monday', duration: '1 hour')
# puts Offer.last
