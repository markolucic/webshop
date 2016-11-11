class Variant < ActiveRecord::Base
	has_many :carts#,  dependent: :destroy
	belongs_to :product
	belongs_to :size
	belongs_to :color

	validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
	validates :color_id, presence: true
	validates :size_id, presence: true
end
