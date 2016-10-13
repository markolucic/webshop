class Cart < ActiveRecord::Base #CartItem
	belongs_to :user
	belongs_to :product
	belongs_to :variant

	validates :quantity, presence:true
end
