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



Product.create(name: "Vans Starke", 
	description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 100, quantity: 10, 
	image: "http://cdn.officeshoes.ws/product_images/2014pl/vuc6at6_blu.jpg?v1", brand_id: 1)

Product.create(name: "Starke Converse", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 110, quantity: 10, 
	image: "http://brendovi.net/images/proizvodi-velike/Lacoste/lacos-spr12-obuca-musk2.jpg", brand_id: 1)

Product.create(name: "Vans Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 120, quantity: 10, 
	image: "http://cdn1.shopmania.biz/files/s3/396466939/p/l/1/platnene-muske-patike-m55105-teget~641.jpg", brand_id: 1)

Product.create(name: "Vans Duboke Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 130, quantity: 10, 
	image: "http://cdn1.shopmania.biz/files/s3/396466939/p/l/3/platnene-muske-patike-m55208-teget~643.jpg", brand_id: 1)

Product.create(name: "Starke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 100, quantity: 10, 
	image: "http://www.buro247.hr/thumb/640x960_0/tenis7.jpg", brand_id: 2)

Product.create(name: "Starke Converse", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 110, quantity: 10, 
	image: "http://www.bravo.rs/wp-content/uploads/2013/04/VSCQ7FL.jpg", brand_id: 3)

Product.create(name: "Vans Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 120, quantity: 10, 
	image: "http://thefabweb.com/wp-content/uploads/2012/02/Vans-Valentines-Day-6.jpg", brand_id: 2)

Product.create(name: "Vans Duboke Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 130, quantity: 10, 
	image: "http://wannabemagazine.com/wp-content/uploads/2013/09/10086430_d1.jpg", brand_id: 4)

	=end