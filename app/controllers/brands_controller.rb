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
			redirect_to admin_brands_path
		else
			render 'new'
		end
	end

	def edit
		@brand = Brand.find(params[:id])
	end

	def update
		@brand = Brand.find(params[:id])

		if @brand.update(brand_params)
			flash[:success] = 'Brand successfully edited.'
			redirect_to admin_brands_path
		else
			render 'edit'
		end
	end

	def destroy
		@brand = Brand.find(params[:id])
		@brand.destroy
		flash[:success] = "Brand successfully deleted."
		redirect_to admin_brands_path
	end

	def destroy_selected
		if params[:ids]
			ids = params[:ids]
			ids.each do |p|
				u = Brand.where(:id => p.to_i)
				u.destroy_all
			end
		end
		flash[:success] = "Brands have been deleted!"
		redirect_to admin_brands_path
	end

	private 

	def brand_params
		params.require(:brand).permit(:name)
	end
end
