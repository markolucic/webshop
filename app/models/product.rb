class Product < ActiveRecord::Base

	belongs_to :brand
	has_and_belongs_to_many :colors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :sizes
end
