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