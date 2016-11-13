class OrdersController < ApplicationController
	before_action :logged_in_user

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		if @order.save

		else
			render 'new'
		end
	end

	def show
		@orders = Order.all.where('user_id = ?', @current_user.id).paginate(:page => params[:page], :per_page => 10).order(:created_at)
	end

	private
		def logged_in_user
			unless logged_in?
				store_location
				flash[:danger] = "You must be logged in!"
				redirect_to login_path
			end
		end

		def order_params
			params.require(:order).permit(:product_id, :user_id, :variant_id, :quantity, :price)
		end
end
