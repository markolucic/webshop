class Address < ActiveRecord::Base
	belongs_to :user

	validates :full_name, presence:true, length: { in: 5..50 }
	validates :address, length: { maximum: 60 }
	validates :city, presence:true, length: { in: 3..50 }
	validates :state, length: { maximum: 50 }
	validates :zip, length: { maximum: 20 }
	validates :phone_number, length: { maximum: 20 }

	def country_name
    	c = ISO3166::Country[country]
    	c.translations[I18n.locale.to_s] || c.name
	end
end
