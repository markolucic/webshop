class AdminsController < ApplicationController
	before_action :correct_user
	before_action :set_data
	helper_method :sort_column, :sort_direction

	def index
	end

	def orders
		@orders = Order.all.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
	end

	def categories
		@categories = Category.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(sort_column + " " + sort_direction)
	end

	def users
		@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(id: :desc)
	end

	def products
		@products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
	end

	def brands
		@brands = Brand.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(:name)
	end

	def sizes
		@sizes = Size.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(:size)
	end

	def colors
		@colors = Color.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(:name)
	end

	private 
	  	def correct_user
			@user = User.find_by(id: params[:id]) 
			unless current_user?(@user) || current_user.is_admin?
				flash[:warning] = "You do not have admin rights!"
				redirect_to(root_url) 
			end
		end

		def set_data
			@categories = Category.paginate(:page => params[:page], :per_page => 10)
			@sizes = Size.paginate(:page => params[:page], :per_page => 10).order(:size)
			@products = Product.paginate(:page => params[:page], :per_page => 10).order(:id)
			@users = User.paginate(:page => params[:page], :per_page => 10).order(:id)
			@brands = Brand.paginate(:page => params[:page], :per_page => 10).order(:name)
			@colors = Color.paginate(:page => params[:page], :per_page => 10).order(:name)
		end

		def user_params
			params.require(:user).permit(:name, :surname, :email, :is_admin, :activated, :activated_at, :password, :password_confirmation) 
		end

		def sort_column
			Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end
		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
end
