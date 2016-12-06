class ColorsController < ApplicationController

	def index
		@colors = Color.all
	end

	def show
		@color = Color.find(params[:id])
	end

	def new
		@color = Color.new
	end

	def create
		@color = Color.new(color_params)
		if @color.save
			flash[:success] = "Color successfully created."
			redirect_to admin_colors_path
		else
			render 'new'
		end
	end

	def edit
		@color = Color.find(params[:id])
	end

	def update
		@color = Color.find(params[:id])

		if @color.update(color_params)
			flash[:success] = 'Color successfully edited.'
			redirect_to admin_colors_path
		else
			render 'edit'
		end
	end

	def destroy
		@color=Color.find(params[:id])
		@color.destroy
		flash[:success] = "Color successfully deleted."
		redirect_to admin_colors_path
	end

	def destroy_selected
		if params[:ids]
			ids = params[:ids]
			ids.each do |p|
				u = Color.where(:id => p.to_i)
				u.destroy_all
			end
		end
		flash[:success] = "Colors have been deleted!"
		redirect_to admin_colors_path
	end

	private 

	def color_params
		params.require(:color).permit(:name, :hex)
	end
end
