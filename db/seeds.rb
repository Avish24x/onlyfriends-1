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
Category.create(name: "Eat Out")
puts "created sport event party entertainment"

images = [
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685631974/development/1cj27m66hu18nxlrnh0u0mllde3e.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685629815/development/bvbqi8vihma5e8xdiyk7rccayodm.png",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685626856/development/fae4o4lmepai17v1c4p0al5attig.png",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709559/clay-banks-GX8KBbVmC6c-unsplash_i3x1ix.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709559/michael-dam-mEZ3PoFGs_k-unsplash_x8tzt6.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709269/d222f555b4b52852aa154cbde8d10d5f_caxeux.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/d8d6410ae0c317178e1318f4ca97ea21_yw9spx.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/cdbd10b2cdf094e27613944f8819b19f_q1qaxc.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/ca1d3c06d5e8554a992201ea492dfe12_vjveut.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/81159f3a28fd2485583af22bb9ccbaa3_uu2pon.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/a4c4c4b69fefdde32120eeb8f8e4a868_kmaatt.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/1956fdd05b46365e97637c6e365ed1e8_mqz5i8.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/c69866f67f2a18b4174c0234cea6091e_nxqis0.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/18aa589555075bb52b5cf7bdffcb8303_urh45w.jpg"
]

12.times do |index|
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
  puts "created fake friends photo"
  fake_friend_seed.save

  rand(0..4).times do
    Tag.create(
      fake_friend_id: fake_friend_seed.id,
      category_id: Category.all.sample.id
    )
    puts "created random tags in the FF"
  end
end

puts "create raph"
raph = FakeFriend.create(
  age: rand(18..45),
  name: "Raph",
  gender: ["Male", "Gender fluid"].sample,
  main_description: "I am a tennis lover, with big biceps, triceps,quadriceps and chocolate 6 pacs",
  price: rand(100..1000),
  rating: rand(0..5),
  user_id: User.last.id
)
file = URI.open("https://i.pinimg.com/564x/d2/22/f5/d222f555b4b52852aa154cbde8d10d5f.jpg")
raph.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
puts "created RAPH photo"
raph.save

puts "created tag sport"
Tag.create(
  fake_friend_id: raph.id,
  category_id: Category.find_by(name: "Sport").id
)
