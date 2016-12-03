class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :show, :update, :edit, :delete] #"moramo biti ulogovani da bismo vidjeli taj sadrzaj"
	before_action :correct_user, only: [:index, :show, :update, :edit, :delete]

	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.activated
			@user.activated_at = Time.zone.now
		end
		if @user.save			
			if !@user.activated
				@user.send_activation_email
				flash[:info] = "Please check your email to activate your account!"
				redirect_to root_url
			else
				flash[:success] = 'User added successfully.'
		        redirect_to admin_users_path
	    	end
		else
			render "new"
		end
	end

	def promote
		user = User.find(params[:id])
		user.update_attribute(:is_admin, true)
		user.save
		redirect_to admin_users_path
	end

	def demote
		user = User.find(params[:id])
		user.update_attribute(:is_admin, false)
		user.save
		redirect_to admin_users_path
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
	    	flash[:danger] = "Pleaser enter all fields!" #flash.now
	    	redirect_to  edit_user_path(@user)
	    end
	end

	def show
		#@user = User.find(params[:id]) zato sto before_action vec jednom pristupa bazi, nema potrebe ponovo to raditi
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "User has been deleted!"
	    redirect_to admin_users_path
	end

	def destroy_selected
		if params[:ids]
			ids = params[:ids]
			ids.each do |p|
				u = User.where(:id => p.to_i)
				u.destroy_all
			end
		end
		flash[:success] = "Users have been deleted!"
		redirect_to admin_users_path
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

		
	private
		def user_params
			params.require(:user).permit(:name, :surname, :email, :is_admin, :activated, :activated_at, :password, :password_confirmation) 
		end
end
