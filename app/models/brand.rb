class Brand < ActiveRecord::Base

	has_many :products
	validates :name, presence: true, length: {minimum: 2, maximum: 20}
end
