# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


i = 1
10.times do
	
	url = "image" + i.to_s + ".jpg"
	Activity.create(title: Faker::Game.title, description: Faker::Lorem.paragraph, price: Faker::Number.decimal(l_digits: 2), image_url: url)
	i +=1

end

10.times do

	i = rand
	email = "user" + i.to_s + "@yopmail.com"
	User.create!(email: email , password: "azerty")

end

puts "Génération terminée"
