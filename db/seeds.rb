# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create test users
User.create!(first_name:  "Alexandre",
             last_name:  "Andrade",
             email: "aleandrade@gmail.com",
             available_point: 55,
             password:              "chattingcat",
             password_confirmation: "chattingcat")

User.create!(first_name:  "April",
             last_name:  "Kim",
             email: "april@chattingcat.com",
             available_point: 71,
             password:              "chattingcat",
             password_confirmation: "chattingcat")



users = User.order(:created_at).take(5)
20.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end
