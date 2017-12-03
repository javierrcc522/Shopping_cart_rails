Product.destroy_all


15.times do
  Product.create!(name: Faker::Name.first_name,
                  price: Faker::Number.between(1, 5))
end

p "Created #{Product.count} products for javi lol"
