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

	#validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }

	has_attached_file :img, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
