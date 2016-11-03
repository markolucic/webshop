class Size < ActiveRecord::Base
	has_and_belongs_to_many :products
	validates :size,  uniqueness:  true, numericality: { only_integer: true, greater_than_or_equal_to: 34, less_than_or_equal_to: 49}
end
