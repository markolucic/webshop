class Address < ActiveRecord::Base
	belongs_to :user

	VALID_ZIP_REGEX = /\A^[a-zA-Z0-9]+$\z/

	validates :full_name, presence:true, length: { maximum: 50 }
	validates :address, presence:true, length: { maximum: 60 }
	validates :city, presence:true, length: { maximum: 40 }, format: {with: /\A^[a-z]+$\z/i}
	validates :state,presence:true, length: { maximum: 50 }, format: {with: /\A^[a-z]+$\z/i}
	validates :zip,presence:true, length: {minimum: 5, maximum: 20 }, format: { with: VALID_ZIP_REGEX } 
	validates :phone_number, presence:true,length: { maximum: 20 },format: {with: /\A^[0-9]+$\z/}

	validates_uniqueness_of :address, scope: [:city], message: 'Address already exist! Please enter a new one.'
	

	def country_name
    	c = ISO3166::Country[country]
    	c.translations[I18n.locale.to_s] || c.name
	end
end
