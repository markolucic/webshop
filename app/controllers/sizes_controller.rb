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
			redirect_to @size
		else
			render 'new'
		end
	end

	def destroy
	end

	private 

	def size_params
		params.require(:size).permit(:size)
	end
end
