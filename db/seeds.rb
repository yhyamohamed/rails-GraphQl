# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
User.destroy_all

User.create(
  username: "yaya",
  email: Faker::Internet.email(name: "yaya"),
  password: "yaya1234",
  password_confirmation: "yaya1234",
)
4.times do |id|
  f_name = Faker::Name.unique.name
  User.create(
    username: f_name,
    email: Faker::Internet.email(name: f_name),
    password: "yaya_#{id}",
    password_confirmation: "yaya_#{id}",
  )
end

users_ids = User.all.pluck(:id)

30.times do |num|
  Post.create(title: Faker::Book.title,
              body: Faker::Quotes::Shakespeare.king_richard_iii_quote,
              user_id: users_ids.sample,
  )
end

posts_ids = Post.all.pluck(:id)
20.times do
  Comment.create(
    text: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    post_id: posts_ids.sample,
    user_id: users_ids.sample
  )
end