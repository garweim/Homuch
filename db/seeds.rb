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
