15.times do
  Product.create!(name: Faker::Name.unique.first_name,
              price: Faker::Number.decimal(2, 2))
end

p "Created #{Product.count} products for javi lol"
