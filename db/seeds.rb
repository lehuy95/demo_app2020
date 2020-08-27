# Create a main sample user.
User.create!(	name: "Tao là admin nè	",
				email: "toidayeumotthienthan0495@gmail.com",
				password:"123456",
				password_confirmation: "123456",
				admin: true
			)
# Generate a bunch of additional users.
99.times do |n|
name = Faker::Name.name
email = "user-#{n+10}@gmail.com"
password = "123456"
User.create!(	name: name,
				email: email,
				password:password,
				password_confirmation: password,
			)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
	content = Faker::Lorem.sentence(word_count: 5)
	users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }