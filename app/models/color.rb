class Color < ActiveRecord::Base
	has_and_belongs_to_many :products
	has_many :variants, dependent: :destroy
	validates :name, presence: true, length: {minimum: 2, maximum: 20}
	validates :hex, presence: true, uniqueness: true, length: { is: 7}, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/ }
end
