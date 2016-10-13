class Variant < ActiveRecord::Base
	#has_many :carts
	belongs_to :product
	belongs_to :size
	belongs_to :color

	#validates :quantity, presence:true #koliko ovakvih ima na stanju
end
