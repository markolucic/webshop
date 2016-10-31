class Color < ActiveRecord::Base
	has_and_belongs_to_many :products

	validates :name, presence: true, length: {minimum: 2, maximum: 20}
	validates :hex, presence: true, uniqueness: true, length: { is: 7}
end
