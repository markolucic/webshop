class Product < ActiveRecord::Base

	belongs_to :brand
	has_and_belongs_to_many :categories
	#has_and_belongs_to_many :sizes
	#has_and_belongs_to_many :colors
	#has_many :colors, through: :variants
	#has_many :sizes, through: :variants
	has_many :variants
	has_many :carts

	accepts_nested_attributes_for :variants, allow_destroy: true
end
