class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@price_max = Product.maximum("price")
		@min_price = params[:min_price]
		@max_price = params[:max_price]
		@brand_id = params[:brand_id]
		@color_id = params[:color_id]
		@size_id = params[:size_id]

		#all products that have category_id equal to the searched one
		@products = Product.joins("join categories_products on products.id = categories_products.product_id").where(["categories_products.category_id = ?", @category.id])
		@products = @products.where("price > ?", @min_price) if params[:min_price].present?
		@products = @products.where("price < ?", @max_price) if params[:max_price].present?
		@products = @products.where("brand_id = ?", @brand_id) if params[:brand_id].present?
		@products = @products.joins(:variants).where("variants.color_id = ?", @color_id) if params[:color_id].present?
		@products = @products.joins(:variants).where("variants.size_id = ?", @size_id) if params[:size_id].present?
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category successfully created."
			redirect_to @category
		else
			render 'new'
		end
	end

	def destroy
	end

	private 

	def category_params
		params.require(:category).permit(:name)
	end
end
