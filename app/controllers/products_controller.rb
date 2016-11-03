class ProductsController < ApplicationController

	def index
		@products = Product.last(12).reverse
	end

	def new
		@brands = Brand.all
		@categories = Category.all
		@product = Product.new
	end

	def create
		name = params[:product][:name]
		description = params[:product][:description]
		price = params[:product][:price]
		img = params[:product][:img]

		@product = Product.new(name: name, description: description, price: price, img: img)
		if @product.save
			flash[:success] = "You have successfully created product."
			redirect_to admin_products_path
		else
			render 'new'
		end
	end

	def show
		@product = Product.find(params[:id])
		@products = Product.where(brand_id: @product.brand_id)
		@colors = []
		@sizes = []
		@product.variants.each do |v|
			@sizes << v.size
			@colors << v.color
		end
		@sizes.sort! { |a,b| a.size <=> b.size }
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def product_params
		params(:product).permit(:name, :description, :price, :img,
		variants_attributes: [:id, :size_id, :quantity, :color_id, :_destroy])
	end
end
