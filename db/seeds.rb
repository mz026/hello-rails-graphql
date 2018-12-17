# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = (1..10).map do |i|
  User.create!({
    name: "User #{i}",
    age: 20 + i,
    email: "jack-#{i}@test.com",
    username: "username-#{i}"
  })
end

users.each do |u|
  3.times do |i|
    idx = i + 1
    Post.create!({
      title: "Post ID #{u.id}-#{idx}",
      user_id: u.id
    })
  end
end

Post.all.each do |po|
  3.times do |i|
    Comment.create!({
      post_id: po.id,
      content: "comment content -- #{po.id}-#{i}"
    })
  end
end
