# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Category.destroy_all
Tag.destroy_all
FakeFriend.destroy_all
User.destroy_all

Category.create(name: "Sport")
Category.create(name: "Event")
Category.create(name: "Party")
Category.create(name: "Entertainment")

10.times do
  user_seed = User.create(
    email: Faker::Internet.email,
    password: "FF1234"
  )

  fake_friend_seed = FakeFriend.create(
    age: rand(18..80),
    name: Faker::Name.first_name,
    gender: ["Female", "Male", "Gender free"].sample,
    main_description: Faker::Quote.yoda,
    price: rand(100..1000),
    rating: rand(0..5),
    user_id: user_seed.id
  )

  rand(0..4).times do
    Tag.create(
      fake_friend_id: fake_friend_seed.id,
      category_id: Category.all.sample.id
    )
  end
end
