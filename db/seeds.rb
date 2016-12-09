# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create known test users so we can login using this details
User.create!(first_name:  "Alexandre",
             last_name:  "MaaT",
             email: "maat@linuxmail.org",
             available_point: 55,
             password:              "chattingcat",
             password_confirmation: "chattingcat")

User.create!(first_name:  "Psy",
             last_name:  "Gangnam",
             email: "psy@super.com",
             available_point: 71,
             password:              "chattingcat",
             password_confirmation: "chattingcat")



users = User.order(:created_at).take(5)
# Generates 20 random posts for each users (max 5)
20.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

# Generates 5 random Organizations and link it to each users
5.times do
  name = Faker::Name.name
  points = rand(5..30)
  organization = Organization.create!(name: name, available_point: points)
  users.each {|user| user.organization_memberships.create!(organization:organization)}
end