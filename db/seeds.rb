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

url = "https://randomuser.me/api/?results=50"
users_data = JSON.parse(open(url).read)




puts 'creating 50 fake users...'
users_data['results'].each do |user_data|
  user = User.new(
    first_name: user_data['name']['first'],
    last_name: user_data['name']['last'],
    address: "#{user_data['location']['street']['number']} #{user_data['location']['street']['namne']} #{user_data['location']['city']} #{user_data['location']['state']}
               #{user_data['location']['country']} #{user_data['location']['postcode']} ",
    email: user_data['email'],
    password: '123456'
  )
  file = URI.open("#{user_data['picture']['large']}")
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
  user.save
end


puts "Creating 3 more user"
alice = User.create!(first_name: 'Alice', last_name: 'Monet', address: '19 Rue des Petits Champs', email: 'alice@gmail.com', password:'123456')
file = URI.open('http://ghost.skillshub.info/content/images/2017/01/profile-girl-square.png')
alice.photo.attach(io: file, filename: 'alice.png', content_type: 'image/png')
jean = User.create!(first_name: 'Jean', last_name: 'Dupont', address: '24 Rue de Sèvres', email: 'jean@gmail.com', password:'123456')
chloe = User.create!(first_name: 'Chloe', last_name: 'Barbeau', address: '20 Rue Dussoubs', email: 'chloe@gmail.com', password:'123456')
puts "#{User.count} users created"

language = ['French', 'English', 'Spanish', 'Chinese', 'Japanese', 'German', 'Arabic']
level = ['Native', 'Advanced', 'Intermediate']
date = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
duration = ['1 hour', '2 hours', '30 minutes']

puts 'Creating 13 offers...'

10.times do
  offer = Offer.new(
    user: User.all.sample,
    language: language.sample,
    level: level.sample,
    date: date.sample,

    duration: duration.sample,
    address: "#{Faker::Address.building_number} #{Faker::Address.street_name}, #{Faker::Address.country_by_code(code: 'FR')}",

  )
  offer.save!
  sleep(1)
end

alice_offer = Offer.new(language: 'French', level: 'Native', date: 'Monday', duration: '1 hour')
alice_offer.user = alice
alice_offer.address = alice.address
alice_offer.save!

jean_offer = Offer.new(language: 'French', level: 'Native', date: 'Monday', duration: '1 hour')
jean_offer.user = jean
jean_offer.address = jean.address
jean_offer.save!

chloe_offer = Offer.new(language: 'French', level: 'Native', date: 'Monday', duration: '1 hour')
chloe_offer.user = chloe
chloe_offer.address = chloe.address
chloe_offer.save!

puts "#{Offer.count} offers created"
