class CategoriesController < ApplicationController
	before_action :correct_user, only: [:index, :new, :create, :update, :destroy]

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
		#@products = Product.joins("join categories_products on products.id = categories_products.product_id").where(["categories_products.category_id = ?", @category.id])
		@products = Product.where("category_id = ?", @category.id) if params[:id].present?
		@products = @products.where("price >= ?", @min_price) if params[:min_price].present?
		@products = @products.where("price <= ?", @max_price) if params[:max_price].present?
		@products = @products.where("brand_id = ?", @brand_id) if params[:brand_id].present?
		@products = @products.joins(:variants).where("variants.color_id = ?", @color_id) if params[:color_id].present?
		@products = @products.joins(:variants).where("variants.size_id = ?", @size_id) if params[:size_id].present?
		@products.paginate(:page => params[:page], :per_page => 6).order(created_at: :desc)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category successfully created."
			redirect_to admin_categories_path
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])

		if @category.update(category_params)
			flash[:success] = 'Category successfully edited.'
			redirect_to admin_categories_path
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		products = Product.where("category_id = ?", @category.id)
		if products
			products.each do |p|
				p.destroy
			end
		end
	    @category.destroy
	    flash[:success] = "Category has been deleted!"
	    redirect_to admin_categories_path
	end

	private 

  	def correct_user
		@user = User.find_by(id: params[:id]) 
		unless current_user?(@user) || current_user.is_admin?
			flash[:warning] = "You do not have permission to access!"
			redirect_to(root_url) 
		end
	end

	def category_params
		params.require(:category).permit(:name)
	end
end
