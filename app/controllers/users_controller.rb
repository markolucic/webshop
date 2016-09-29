class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :show, :update, :edit] #"moramo biti ulogovani da bismo vidjeli taj sadrzaj"
	before_action :correct_user, only: [:index, :show, :update, :edit]
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save			
			@user.send_activation_email
        	flash[:info] = "Please check your email to activate your account!"
			redirect_to root_url
		else
			render "new"
		end
	end

	def edit
		#@user = User.find(params[:id])zato sto before_action vec jednom pristupa bazi, nema potrebe ponovo to raditi
	end

	def update
		#@user = User.find(params[:id]) zato sto before_action vec jednom pristupa bazi, nema potrebe ponovo to raditi
	    if @user.update_attributes(user_params)
	      flash[:success] = "You have edited your account successfully!"
	      redirect_to root_url
	    else
	    	flash[:danger] = "Pleaser enter all fields!"
	    	redirect_to  edit_user_path(@user)
	    end
	end

	def show
		#@user = User.find(params[:id]) zato sto before_action vec jednom pristupa bazi, nema potrebe ponovo to raditi
	end

	def user_params
		params.require(:user).permit(:name, :surname, :email, :is_admin, :password, :password_confirmation) 
	end

	# Confirms a logged in user
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "You must be logged in!"
			redirect_to login_path
		end
	end

	# Confirms the correct user
	def correct_user
		@user = User.find_by(id: params[:id]) #User.find(params[:id]) ako ne postoji user u bazi sa takvim id
		redirect_to(root_url) unless current_user?(@user) || current_user.is_admin? # || current_user.is_admin? postoji bolje rjesenje, ovako admin moze gledati profile ostalih i mijenjati
	end
end
