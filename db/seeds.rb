# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "destruction de l'ancienne BDD en cours"
Activity.destroy_all
User.destroy_all
puts "destruction terminée"


puts "Génération de la nouvelle BDD en cours"



puts "Extraction du CSV en cours"
file = CSV.read("actvities_seville2.csv")
puts "Extraction terminée"

puts "Génération des activités en cours" 
20.times do
	
	number = rand(1..(file.size - 1))
	Activity.create(title: file[number][0], description: file[number][1], price: file[number][2], image_url: file[number][3])

end
puts "Génération des activités terminées"

puts "Génération des utilisateurs en cours" 
20.times do |i|

	email = "user" + i.to_s + "@yopmail.com"
	User.create!(email: email , password: "azerty")

end
puts "Génération des utilisateurs terminées"

puts "Génération terminée"
