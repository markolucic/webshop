class SizesController < ApplicationController
	def index
		@sizes = Size.all
	end

	def show
		@size = Size.find(params[:id])
	end

	def new
		@size = Size.new
	end

	def create
		@size = Size.new(size_params)
		if @size.save
			flash[:success] = "Size successfully created."
			redirect_to admin_sizes_path
		else
			render 'new'
		end
	end

	def edit
		@size = Size.find(params[:id])
	end

	def update
		@size = Size.find(params[:id])

		if @size.update(size_params)
			flash[:success] = 'Size successfully edited.'
			redirect_to admin_sizes_path
		else
			render 'edit'
		end
	end

	def destroy
		@size = Size.find(params[:id])
		@size.destroy
		flash[:success] = "Size successfully deleted."
		redirect_to admin_sizes_path
	end

	private 

	def size_params
		params.require(:size).permit(:size)
	end
end
