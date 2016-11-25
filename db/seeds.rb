User.create!(first_name:  "Eugene",
             last_name: "Domotenko",
             email: "e.domotenko@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

20.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "user-#{n+1}@goal.org"
  password = "password"
  User.create!(first_name:  first_name,
               last_name:  last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
  title = Faker::Book.title
  description = Faker::Lorem.sentence(5)
  prioriry = Faker::Number.between(0, 10)
  due_date = Faker::Date.forward(25)
  users.each  do |user| 
                user.tasks.create!(title: title, 
                                  description: description, 
                                  priority: prioriry,
                                  due_date: due_date) 
              end
end