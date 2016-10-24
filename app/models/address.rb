class Address < ActiveRecord::Base
	belongs_to :user

	PHONE_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/

	validates :full_name, presence:true#, length: { in: 5..50 }
	validates :address, length: { maximum: 60 }
	validates :city, presence:true, length: { in: 3..50 }
	validates :state, length: { maximum: 50 }
	validates :zip, length: { maximum: 20 }, numericality: { only_integer: true } 
	validates :phone_number, length: { maximum: 20 }, :format => PHONE_REGEX
	

	def country_name
    	c = ISO3166::Country[country]
    	c.translations[I18n.locale.to_s] || c.name
	end
end
