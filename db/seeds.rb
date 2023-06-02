# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

Tag.destroy_all
puts "deleted all tag"
Booking.destroy_all
puts "deleted all booking"
Category.destroy_all
puts "deleted all category"
FakeFriend.destroy_all
puts "deleted all fakfriends"
User.destroy_all
puts "deleted all user"

Category.create(name: "Sport")
Category.create(name: "Event")
Category.create(name: "Party")
Category.create(name: "Entertainment")
puts "created sport event party entertainment"

images = [
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685631974/development/1cj27m66hu18nxlrnh0u0mllde3e.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685629815/development/bvbqi8vihma5e8xdiyk7rccayodm.png",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685626856/development/fae4o4lmepai17v1c4p0al5attig.png"
]

3.times do |index|
  user_seed = User.create(
    email: Faker::Internet.email,
    password: "FF1234"
  )
  user_seed.save

  fake_friend_seed = FakeFriend.create(
    age: rand(18..80),
    name: Faker::Name.first_name,
    gender: ["Female", "Male", "Gender free"].sample,
    main_description: Faker::Quote.yoda,
    price: rand(100..1000),
    rating: rand(0..5),
    user_id: user_seed.id
  )
  puts "create fakefriends"

  file = URI.open(images[index])
  fake_friend_seed.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "created 10 fake friends photo"
  fake_friend_seed.save

  rand(0..4).times do
    Tag.create(
      fake_friend_id: fake_friend_seed.id,
      category_id: Category.all.sample.id
    )
    puts "created 10 random 10tags"
  end
end
