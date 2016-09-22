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
        	flash[:success] = "You have successfully registered!"
			redirect_to root_url
		else
			flash[:error] = "Ooooppss, something went wrong!"
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :surname, :email, :is_admin, :is_active, :password) #password_digest
	end

end
