class Product < ActiveRecord::Base

	before_destroy :delete_all

	belongs_to :brand
	belongs_to :category
	#has_and_belongs_to_many :categories
	#has_many :colors, through: :variants
	#has_many :sizes, through: :variants
	has_many :variants#, dependent: :destroy
	has_many :carts#, dependent: :destroy
  has_many :orders
  
	accepts_nested_attributes_for :variants, allow_destroy: true

	has_attached_file :img, styles: { large: "300x300>", medium: "200x180#", thumb: "100x100#" },
		  	:storage => :s3,
    		:s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  	#validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
    validates_attachment :img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
    validates_attachment :img, presence: true, :on => :create
  	validates :name, presence: true, length: { minimum: 2, maximum: 30}
  	validates :description, presence: true, length: {minimum: 5, maximum: 200}
  	validates :price, presence: true, :numericality => {  :greater_than => 0}
  	validates :brand_id, presence: true
  	validates :category_id, presence: true;

  	def self.search(search)
      if search
        search = search.downcase
        where('lower(name) LIKE ?', "%#{search}%")
      else
        all
      end
    end

    def s3_credentials
    	{
    		:bucket => ENV["S3_BUCKET_NAME"],
		    :access_key_id => ENV["ACCESS_KEY_ID"],
			:secret_access_key => ENV["SECRET_ACCESS_KEY"],
			:region => ENV["AWS_REGION"]
    	}
  	end

  	# Delete all variants of the product and clear cart
  	def delete_all
  		id = self.id
		#user = current_user
		#cart = Cart.where("user_id = ?", user.id)
		cart = Cart.where("product_id = ?", id)
		cart.destroy_all if cart
		variants = Variant.where("product_id = ?", id)
		variants.destroy_all if variants
	end

end
