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
			redirect_to @color
		else
			render 'new'
		end
	end

	def destroy
		@color=Color.find(params[:id])
		@color.destroy
		flash[:success] = "Color successfully deleted."
		redirect_to admin_colors_path
	end

	private 

	def color_params
		params.require(:color).permit(:name, :hex)
	end
end
