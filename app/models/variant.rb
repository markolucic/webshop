class Variant < ActiveRecord::Base
	has_many :carts
	belongs_to :product
	belongs_to :size
	belongs_to :color

	validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
end
