class UsersController < ApplicationController
	before_filter :authorize, only: [:show, :update, :edit] #"moramo biti ulogovani da bismo vidjeli taj sadrzaj"

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
			redirect_to login_path
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if @user.update_attributes(user_params)
	      flash[:success] = "You have edited your account successfully!"
	      redirect_to root_url
	    else
	    	flash[:danger] = "Pleaser enter all fields!"
	    	redirect_to  edit_user_path(@user)
	    end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :surname, :email, :is_admin, :is_active, :password, :password_confirmation) 
	end

end
