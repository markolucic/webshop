class Cart < ActiveRecord::Base
	belongs_to :user
	#has_many :products
	belongs_to :product

	validates :quantity, presence:true
end
