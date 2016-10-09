class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		#all products that have category_id equal to the searched one
		@products = Product.joins("join categories_products on products.id = categories_products.product_id").where(["categories_products.category_id = ?", @category.id])
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
