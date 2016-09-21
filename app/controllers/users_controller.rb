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
			UserMailer.registration_confirmation(@user).deliver
        	flash[:success] = "Please confirm your email address to continue"
			redirect_to root_url
		else
			flash[:error] = "Ooooppss, something went wrong!"
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
