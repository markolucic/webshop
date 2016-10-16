# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

Color.create(name: "Crvena", hex: "#ff0000")
Color.create(name: "Plava", hex: "#0066ff")
Color.create(name: "Svijetloplava", hex: "#99ccff")
Color.create(name: "Zuta", hex: "#ffff00")
Color.create(name: "Bijela", hex: "#ffffff")
Color.create(name: "Narandzasta", hex: "#ff6600")
Color.create(name: "Zelena", hex: "#33cc33")
Color.create(name: "Smedja", hex: "#804000")
Color.create(name: "Ljubicasta", hex: "#cc33ff")
Color.create(name: "Crna", hex: "#000000")
Color.create(name: "Siva", hex: "#808080")
Color.create(name: "Roza", hex: "#ff99c2")

Brand.create(name: "Converse")
Brand.create(name: "Nike")
Brand.create(name: "Vans")
Brand.create(name: "Puma")
Brand.create(name: "DC")
Brand.create(name: "Toms")
Brand.create(name: "Adidas")
Brand.create(name: "Tommy Hilfiger")
Brand.create(name: "Timberland")

(34..48).each do |n|
	Size.create(size: n)
end


Product.create(name: "Starke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
 price: 100, quantity: 10, 
 image: "http://www.24sata.rs/resources/images/0000/017/030/starke%20slika2_1000x0.jpg")

Product.create(name: "Starke Converse", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 110, quantity: 10, 
	image: "http://www.sport-line.rs/image/cache/data/starke/27242_900-800x600.jpg")

Product.create(name: "Vans Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 120, quantity: 10, 
	image: "http://images.vans.com/is/image/Vans/EE3BLK-HERO?$356x356$")

Product.create(name: "Vans Duboke Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 130, quantity: 10, 
	image: "http://images.vans.com/is/image/Vans/XH8FH3-HERO?$356x356$")

Product.create(name: "Vans Starke", 
	description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 100, quantity: 10, 
	image: "http://cdn.officeshoes.ws/product_images/2014pl/vuc6at6_blu.jpg?v1")

Product.create(name: "Starke Converse", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 110, quantity: 10, 
	image: "http://brendovi.net/images/proizvodi-velike/Lacoste/lacos-spr12-obuca-musk2.jpg")

Product.create(name: "Vans Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 120, quantity: 10, 
	image: "http://cdn1.shopmania.biz/files/s3/396466939/p/l/1/platnene-muske-patike-m55105-teget~641.jpg")

Product.create(name: "Vans Duboke Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 130, quantity: 10, 
	image: "http://cdn1.shopmania.biz/files/s3/396466939/p/l/3/platnene-muske-patike-m55208-teget~643.jpg")

Product.create(name: "Starke", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 100, quantity: 10, 
	image: "http://www.buro247.hr/thumb/640x960_0/tenis7.jpg")

Product.create(name: "Starke Converse", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 110, quantity: 10, 
	image: "http://www.bravo.rs/wp-content/uploads/2013/04/VSCQ7FL.jpg")

Product.create(name: "Vans Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 120, quantity: 10, 
	image: "http://i.ebayimg.com/00/s/MTAwMVgxMDAx/z/23EAAOSwZG9Wiojr/$_35.JPG")

Product.create(name: "Vans Duboke Patike", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
	price: 130, quantity: 10, 
	image: "http://images.vans.com/is/image/Vans/18IJMA-HERO?id=wIdq21&fmt=jpg&fit=constrain,1&wid=581&hei=581&qlt=85,1&op_sharpen=0&resMode=sharp2&op_usm=1,1,6,0&$583x583$")

#random dodavanje brenda
Product.all.each do |n|
  p=Product.find(n)
  p.brand=Brand.find(rand(1..9))
  p.save
end

#dodavanje po 1 random kategorije
Product.all.each do |n|
  p=Product.find(n)
  p.categories= [Category.find(rand(1..4))]
  p.save
end


=begin
#dodavanje po 5 velicina
Product.all.each do |n|
  p=Product.find(n)
  p.sizes= [Size.find(rand(1..14)), Size.find(rand(1..14)), Size.find(rand(1..14)), Size.find(rand(1..14)), Size.find(rand(1..14))]
  p.save
end

#dodavanje po 3 random boje
Product.all.each do |n|
  p=Product.find(n)
  p.colors= [Color.find(rand(1..5)), Color.find(rand(1..5)), Color.find(rand(1..5))]
  p.save
end

#dodavanje varijacija proizvoda
Product.all.each do |n|
  v =Variant.create(:quantity => "10")
  v.product_id = rand(1..12)
  v.color_id = rand(1..5)
  v.size_id = rand(1..9)
  v.save
end
=end

Product.all.each do |prod|
  (1..3).each do |n|
    p=Variant.create(quantity: "5")
    p.color_id=rand(1..9)
    p.size_id=rand(1..14)
    prod.variants<<p
    prod.save
  end
end


=begin
Product.all.each do |p|
  p.variants.each do |pv|
    if p.categories.first.id==1
      pv.size_id=rand(39..52)
      pv.save
    elsif p.categories.first.id==2
      pv.size=rand(36..42)
      pv.save
    elsif p.categories.first.id==3
      pv.size=rand(21..35)
      pv.save
    else
      pv.size=rand(36..50)
      pv.save
    end
  end
  p.save
end
=end