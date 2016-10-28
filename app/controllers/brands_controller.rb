class BrandsController < ApplicationController

	def index
		@brands = Brand.all
	end

	def show
		@brand = Brand.find(params[:id])
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.save
			flash[:success] = "Brand successfully created."
			redirect_to @brand
		else
			render 'new'
		end
	end

	def destroy
		@brand = Brand.find(params[:id])
		@brand.destroy
		flash[:success] = "Brand successfully deleted."
		redirect_to admin_brands_path
	end

	private 

	def brand_params
		params.require(:brand).permit(:name)
	end
end
