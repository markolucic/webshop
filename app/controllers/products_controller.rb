class ProductsController < ApplicationController
	before_filter :set_data

	def index
		@products = Product.last(12).reverse
	end

	def new
		@product = Product.new
		@product.variants.build
	end

	def create
		#name = params[:product][:name]
		#description = params[:product][:description]
		#price = params[:product][:price]
		#img = params[:product][:img]
		#brand_id = params[:product][:brand_id].to_i
		#cat_ids = params[:product][:category_ids]
		color_id = params[:product][:variants_attributes]["0"][:color_id] if !params[:product][:variants_attributes]["0"][:color_id].nil?
		size_id = params[:product][:variants_attributes]["0"][:size_id] if !params[:product][:variants_attributes]["0"][:size_id].nil?
		quantity = params[:product][:variants_attributes]["0"][:quantity].to_i if !params[:product][:variants_attributes]["0"][:quantity].nil?
		@product = Product.new(product_params)
		#@product = Product.new(name: name, description: description, price: price, img: img, category_ids: cat_ids, brand_id: brand_id)
		v = Variant.create(product_id: @product.id, color_id: color_id, size_id: size_id, quantity: quantity)
		v.save
		#@product.variants << v
		if @product.save
			flash[:success] = "You have successfully created product."
			redirect_to admin_products_path
		else
			@brands = Brand.all
			@categories = Category.all
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
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			flash[:success] = 'Product successfully edited.'
			redirect_to admin_products_path
		else
			render 'edit'
		end
	end

	def destroy
		page = params[:page]
		@product=Product.find(params[:id])
		@product.destroy
		flash[:success] = "Product successfully deleted."
		redirect_to admin_products_path 
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :img, :brand_id, :category_id,
		variants_attributes: [:id, :size_id, :quantity, :color_id, :_destroy])
	end

	def set_data
		@brands = Brand.all
		@categories = Category.all
		@sizes = Size.all
		@colors = Color.all
	end
end
