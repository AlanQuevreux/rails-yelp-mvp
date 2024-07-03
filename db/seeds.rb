# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Supprime tous les restaurants avant de créer de nouveaux
puts "Cleaning database..."
Restaurant.destroy_all
# Crée de nouveaux restaurants
puts "Creating restaurants..."
barakafrit = {name: "Barakafrit", address: "169 Rue de Montmartre, Paris", category: "belgian"}
pizza_east =  {name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "italian"}
chez_claude = {name: "Chez Claude", address: "Place de la République, Paris", category: "french"}
dazuma = {name: "Dazuma", address: "44 Rue Beaurepaire, Angers", category: "japanese"}
wok_city = {name: "Wok City", address: "10 Avenue de l'Opéra, Paris", category: "chinese"}

[barakafrit, pizza_east, chez_claude, dazuma, wok_city].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
