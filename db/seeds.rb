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

30.times do
  Wiki.create!(
    title: Faker::HitchhikersGuideToTheGalaxy.location,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    private: false
  )
end
