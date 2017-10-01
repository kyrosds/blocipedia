# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'
require 'faker'

10.times do
  User.create!(
    name: Faker::StarWars.character,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: 'standard'
  )
end

users = User.all

10.times do
  Wiki.create!(
    title: Faker::HitchhikersGuideToTheGalaxy.location,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    private: false,
    user: users.sample
  )
end

10.times do
  Wiki.create!(
    title: Faker::FamilyGuy.character,
    body: Faker::FamilyGuy.quote,
    private: true,
    user: users.sample
  )
end

User.create!(
  name: 'David Sires',
  email: 'd.sires@yahoo.com',
  password: 'helloworld',
  role: 'admin'
)

User.create!(
  name: Faker::StarWars.character,
  email: 'premium@email.com',
  password: 'helloworld',
  role: 'premium'
)

User.create!(
  name: Faker::StarWars.character,
  email: 'standard@email.com',
  password: 'helloworld',
  role: 'standard'
)
