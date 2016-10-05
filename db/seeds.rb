# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
User.create(name: 'Marko', surname: 'Lucic', email: 'marko_lucic_1994@yahoo.com', 
			is_admin: true, password: 'markolucic', activated: true, activated_at: Time.zone.now)

5.times do |n|
	name = "user#{n+1}"
	surname = "surname#{n+1}"
	email = "example-#{n+1}@abhshoes.com"
	password = "password"
	User.create!(name: name, surname: surname, email: email, password: password, 
				 password_confirmation: password, activated: true, activated_at: Time.zone.now)
end


=end
Category.create(name: "Muška obuća")
Category.create(name: "Ženska obuća")
Category.create(name: "Dječija obuća")
Category.create(name: "Sportska obuća")

Product.create(name: "Starke", description: "Opis", price: 100, quantity: 10, image: "http://www.24sata.rs/resources/images/0000/017/030/starke%20slika2_1000x0.jpg")
Product.create(name: "Starke Converse", description: "Opis", price: 110, quantity: 10, image: "http://www.vijesti.me/media/cache/42/89/4289781ebf94f4b3d23e6231f62454e5.jpg")
Product.create(name: "Vans Patike", description: "Opis", price: 120, quantity: 10, image: "http://images.vans.com/is/image/Vans/EE3BLK-HERO?$356x356$")
Product.create(name: "Vans Duboke Patike", description: "Opis", price: 130, quantity: 10, image: "http://images.vans.com/is/image/Vans/XH8FH3-HERO?$356x356$")

Color.create(name: "Crvena", hex: "ff0000")
Color.create(name: "Zuta", hex: "ffff00")
Color.create(name: "Zelena", hex: "33cc33")
Color.create(name: "Plava", hex: "0000ff")
Color.create(name: "Crna", hex: "000000")

Brand.create(name: "Converse")
Brand.create(name: "Nike")
Brand.create(name: "Vans")
Brand.create(name: "DC")
Brand.create(name: "Toms")

(38..46).each do |n|
	Size.create(size: n)
end