class AdminsController < ApplicationController
	before_action :correct_user
	before_action :set_data

	def index
	end

	def categories
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
			@categories = Category.all
			@sizes = Size.all
			@users = User.all
			@products = Product.all
			@users = User.all
			@brands = Brand.all
			@colors = Color.all
		end
end
