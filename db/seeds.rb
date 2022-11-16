# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Checking for at least one user...'
if User.all.count.zero?
  abort 'At least one User must exist, please register a user...'
end

user = User.first

puts "Destroying data"
Island.destroy_all

puts 'Creating islands...'
ambon = { name: 'Ambon', description: 'Ambon is the capital and main gateway of Maluku province, which holds many of the hidden gems in Indonesia.', price_per_day: 450 }
seram_island = { name: 'Seram Island', description: 'Seram Island is best known for Ora Beach, a secluded private resort with views like Bora Bora. The island also has Manusela National Park, where you can see lots of unique tropical birds and the deepest cave in Indonesia.', price_per_day: 550 }
halmahera_island = { name: 'Halmahera Island', description: 'This is the biggest island in the Maluku Islands, and it\’s loaded with rainforests, volcanoes, and hidden beaches.', price_per_day: 475 }
ternate_island = { name: 'Ternate Island', description: 'This is a small, cone-shaped volcanic island in the North Maluku province of east Indonesia. Ternate isn\’t likely to become the next big vacation island in Indonesia, but it has some interesting sights and history.', price_per_day: 675 }
banyak_island = { name: 'Banyak Island', description: 'The Banyak Islands are a group of barely inhabited paradise islands northwest of Sumatra, Indonesia.', price_per_day: 775 }
belitung_island = { name: 'Belitung Island', description: 'Belitung is a Bali-sized island off the coast of south Sumatra, and just like Bali it has so many amazing things to see and do. It\’s even been recognized as a UNESCO Geopark for its unique landscapes.', price_per_day: 575 }
selayar_island = { name: 'Selayar Island', description: 'This is another good place for snorkeling and island hopping, or you can stay directly on a private white sand beach at Selayar Eco Resort.', price_per_day: 525 }
siau_island = { name: 'Siau Island', description: 'Siau is a small volcanic island north of Manado, but it’s more remote than Bunaken and not as well known, even though it deserves to be.', price_per_day: 550 }
bunaken_island = { name: 'Bunaken Island', description: 'The Bunaken Marine Park has some of the most popular Indonesian islands for snorkeling and scuba diving, and there\’s even a big sandbar you can walk around on when the tide is low.', price_per_day: 550 }
sombori_island = { name: 'Sombori Island', description: 'Sombori Island has to be one of the most wonderful places we\’ve seen in Indonesia. The hundreds of paradise islands and lagoons have earned it the nickname of \‘the Raja Ampat of Sulawesi\’ because it looks just like the famous islands in West Papua.', price_per_day: 950 }
labengki_island = { name: 'Labengki Island', description: 'Labengki Island might be Indonesia\’s best kept secret. This untouched tropical paradise in Sulawesi is impossibly beautiful. It’s one of the most enchanting places we\’ve visited in our travels.', price_per_day: 770 }
sulawesi_island = { name: 'Sulawesi Island', description: 'Sulawesi is one of my favorite islands to explore in Indonesia. Many of the strangest things we\’ve ever seen have been on this island.', price_per_day: 770 }


[ambon, seram_island, halmahera_island, ternate_island, banyak_island, belitung_island, selayar_island, siau_island, bunaken_island, sombori_island, labengki_island, sulawesi_island].each do |attributes|
  island = Island.new(attributes)
  island.user = user
  island.save!
  puts "Created #{island.name}"
end
puts 'Finished!'
