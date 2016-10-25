class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "You have successfully created product."
			redirect_to @product
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
		if @colors.empty?
			@colors << Color.create(name: "No colors")
		end
		if @sizes.empty?
			@sizes << Size.create(size: 0)
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def product_params
		params(:product).permit(:name, :description, :price, :quantity,
		variants_attributes: [:id, :size_id, :quantity, :color_id, :_destroy])
	end
end
