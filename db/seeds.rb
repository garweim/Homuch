# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
User.destroy_all
puts "create users"
User.create!(first_name: "gary", last_name: "weimberg", email: "gary@gmail.com", password: "123456")
User.create!(first_name: "aida", last_name: "bennouna", email: "aida@gmail.com", password: "123456")
User.create!(first_name: "geoffroy", last_name: "vdp", email: "geoffroy@gmail.com", password: "123456")
User.create!(first_name: "didier", last_name: "dewasseige", email: "didier@gmail.com", password: "123456")

puts "done"


Project.destroy_all
puts "create assets"
Project.create(name:"Project1", street_and_nr: "Ixelles", zipcode: 1000, surface: 150, nr_of_bedrooms: 3, category: "appartment",
nr_of_bathrooms: 1, state:"good", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)
Project.create(name:"Project2", street_and_nr: "Anvers", zipcode: 1000, surface: 150, nr_of_bedrooms: 3, category: "appartment",
nr_of_bathrooms: 2, state:"bad", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)
Project.create(name:"Project3", street_and_nr: "Arlon", zipcode: 1000, surface: 200, nr_of_bedrooms: 3, category: "appartment",
nr_of_bathrooms: 1, state:"good", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)

puts "done"

Estimate.destroy_all
puts "create estimates"
Estimate.create(market_price:500, rental_price:2, roi_rate:0.03, roi_price:450, loan_payment:45, project_id: Project.all.sample.id)
Estimate.create(market_price:450, rental_price:3, roi_rate:0.03, roi_price:400, loan_payment:40, project_id: Project.all.sample.id)
Estimate.create(market_price:520, rental_price:2, roi_rate:0.03, roi_price:460, loan_payment:46, project_id: Project.all.sample.id)

puts "done"

SellMarket.destroy_all
puts "appartments in the market that are sold..."
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:2, price:410000)
SellMarket.create(zipcode: 1000, surface:290, nr_of_bedrooms:2, nr_of_bathrooms:2, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:3, nr_of_bathrooms:1, price:410000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:160, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:220, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:220, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:220, nr_of_bedrooms:3, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:240, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:260, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:215, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:100, nr_of_bedrooms:2, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:190, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:2, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:3, nr_of_bathrooms:1, price:480000)
SellMarket.create(zipcode: 1000, surface:210, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:360000)
SellMarket.create(zipcode: 1000, surface:220, nr_of_bedrooms:2, nr_of_bathrooms:1, price:360000)
SellMarket.create(zipcode: 1000, surface:220, nr_of_bedrooms:2, nr_of_bathrooms:1, price:360000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:1, price:430000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:1, price:420000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:1, price:380000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:2, price:400000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:3, nr_of_bathrooms:1, price:440000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:440000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:380000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:380000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:380000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:380000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:380000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:2, price:400500)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:2, nr_of_bathrooms:2, price:400500)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:3, nr_of_bathrooms:1, price:440000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:440000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:390000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:390000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:2, price:390000)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:3, nr_of_bathrooms:2, price:390000)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:3, nr_of_bathrooms:2, price:390000)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400500)
SellMarket.create(zipcode: 1000, surface:280, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400500)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:2, nr_of_bathrooms:2, price:440000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:3, nr_of_bathrooms:1, price:440000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:440000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:390000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:390000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:390000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400000)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400000)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400500)
SellMarket.create(zipcode: 1000, surface:300, nr_of_bedrooms:3, nr_of_bathrooms:2, price:400500)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:180, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400500)
SellMarket.create(zipcode: 1000, surface:200, nr_of_bedrooms:3, nr_of_bathrooms:1, price:400500)

puts "done"














