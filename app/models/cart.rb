class Cart < ActiveRecord::Base #CartItem
	belongs_to :user
	belongs_to :product

	validates :quantity, presence:true
end
