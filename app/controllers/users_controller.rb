class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save			
			flash[:notice] = "You signed up successfully"
			redirect_to root_url
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :surname, :phone, :email, :is_admin, :is_active, :password_digest) #password_digest
	end

end
