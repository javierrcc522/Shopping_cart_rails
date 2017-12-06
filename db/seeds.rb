Product.destroy_all
User.destroy_all

User.create(username: "aGuy",
            email: "test@gmail.com",
            password: "password",
            is_female: true,
            date_of_birth: Date.new,
            admin: true)

15.times do
  Product.create!(name: Faker::Name.first_name,
                  price: Faker::Number.between(1, 5))
end

p "Created #{Product.count} products for javi lol"
p "Created #{User.count} users"
