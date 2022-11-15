# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying data"
Island.destroy_all

10.times do
  island = Island.create(name: 'Hawai beach', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur gravida vulputate. Nulla egestas nulla sodales, imperdiet ligula sed, gravida nunc. Sed auctor velit sit amet purus fermentum, sed iaculis tortor placerat. Ut mattis nulla ligula, eu pulvinar orci tristique vitae. In eu ligula volutpat, pretium ex sed, sodales ante.', price_per_day: rand(2..2022), latitude: 5.776283, longitude: 6.7626, address: 'Hawai main town')
  puts island.name
end
