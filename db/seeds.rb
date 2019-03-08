50.times do |n|
  name = Faker::Name.first_name
  fakermail = Faker::Internet.email
  email = "#{n+1}#{fakermail}"
  password = "password"
  User.create!(name:  name,
              email:  email,
              password:               password,
              password_confirmation:  password,
        )
end