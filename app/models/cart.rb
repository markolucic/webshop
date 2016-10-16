class Cart < ActiveRecord::Base #CartItem

	belongs_to :user
	belongs_to :product
	belongs_to :variant

	validates :quantity, presence:true
	validates :color, presence:true
	validates :size, presence:true
end
