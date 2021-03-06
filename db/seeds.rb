# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ua = User.create!(name: "Usuario Administrador",
                  email: "usuario@administrador.cl",
                  password: "foobar",
                  password_confirmation: "foobar",
                  admin: true)
ua.generate_token_and_save

20.times do |n|
  name = Faker::StarWars.unique.character
  email = Faker::Internet.unique.email
  password = "password"
  u =  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
  u.generate_token_and_save
end

5.times do |n|
  name = Faker::Hipster.unique.word + "_raffle_category"
  description = Faker::Hipster.sentence
  RaffleCategory.create!(name: name,
                         description: description)
end

3.times do |n|
  name = Faker::Hipster.unique.word + "_prize_category"
  description = Faker::Hipster.sentence
  PrizeCategory.create!(name: name,
                         description: description)
end

5.times do |n|
  name = Faker::Hipster.unique.word + "_raffle"
  description = Faker::Hipster.sentence
  price = rand(100.1000)
  final_date = Time.now
  collected_money = 0
  user_id = rand(1..21)
  raffle_category_id = rand(1 .. 6)
  Raffle.create!(name: name,
                 description: description,
                 price: price,
                 final_date: final_date,
                 collected_money: collected_money,
                 user_id: user_id,
                 raffle_category_id: raffle_category_id)
end

Prize.create!( name: "prize from seed",
               description: "this prize is worthless",
               prize_category_id: 1,
               raffle_id: 1)
