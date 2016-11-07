class AdminsController < ApplicationController
	before_action :correct_user
	before_action :set_data
	helper_method :sort_column, :sort_direction

	def index
	end

	def categories
		@categories = Category.order(sort_column + " " + sort_direction)
	end

	def users
	end

	def products
	end

	def brands
	end

	def sizes
	end

	def colors
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
			@sizes = Size.paginate(:page => params[:page], :per_page => 10)
			@products = Product.paginate(:page => params[:page], :per_page => 10).order(:id)
			@users = User.paginate(:page => params[:page], :per_page => 10).order(:id)
			@brands = Brand.paginate(:page => params[:page], :per_page => 10)
			@colors = Color.paginate(:page => params[:page], :per_page => 10)
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
