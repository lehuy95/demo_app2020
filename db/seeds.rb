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
