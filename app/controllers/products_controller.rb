class ProductsController < ApplicationController
	before_filter :set_data

	def index
		#@products = Product.last(12).reverse
		@products = Product.all
		@products = @products.sample(12)
		@sales = Product.last(4)
	end

	def new
		@product = Product.new
		@product.variants.build
	end

	def show_data
		color = params[:color]
		colors = Color.where(name: color)
		color_id = colors.first.id
		product_id = params[:product_id]
		#@products = Product.joins(:variants).where("variants.color_id = ?", color_id) if params[:color].present?
		@variants = Variant.where(product_id: product_id)
		@variants = @variants.where(color_id: color_id)
		@sizes = []
		@variants.each do |v|
			@sizes << v.size.size
		end
		respond_to do |format| 
			format.html
			format.json {render json: @sizes}
		end
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
		@product.quantity = quantity
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
			if !@colors.include? v.color
				@colors << v.color 
			end
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

	def destroy_selected
		if params[:ids]
			ids = params[:ids]
			ids.each do |p|
				u = Product.where(:id => p.to_i)
				u.destroy_all
			end
		end
		flash[:success] = "Products have been deleted!"
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
