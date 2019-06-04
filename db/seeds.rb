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


Asset.destroy_all
puts "create assets"
Asset.create(name:"Asset", address:"london", surface: 150, nr_of_bedrooms: 3, type_asset: "appartment",
nr_of_bathrooms: 1, state:"good", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)
Asset.create(name:"Asset", address:"london", surface: 150, nr_of_bedrooms: 3, type_asset: "appartment",
nr_of_bathrooms: 2, state:"bad", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)
Asset.create(name:"Asset", address:"london", surface: 200, nr_of_bedrooms: 3, type_asset: "appartment",
nr_of_bathrooms: 1, state:"good", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)
Asset.create(name:"Asset", address:"london", surface: 200, nr_of_bedrooms: 3, type_asset: "appartment",
nr_of_bathrooms: 2, state:"bad", garage: 1, terrace: true, heating: true, electricity: true, kitchen: true, sanitation: true, user_id: User.all.sample.id)

Estimate.destroy_all
puts "create estimates"
Estimate.create(market_price:500, rental_price:2, roi_rate:0.03, roi_price:450, loan_payment:45, asset_id: Asset.all.sample.id)
Estimate.create(market_price:450, rental_price:3, roi_rate:0.03, roi_price:400, loan_payment:40, asset_id: Asset.all.sample.id)
Estimate.create(market_price:520, rental_price:2, roi_rate:0.03, roi_price:460, loan_payment:46, asset_id: Asset.all.sample.id)
