class VariantsController < ApplicationController
	
	#def create
	#	@variant = Variant.new(product_id: params[:product],
	#						   color_id: params[:color],
	#						   size_id: params[:size], 
	#						   quantity: params[:quantity])
	#	@variant.save
	#	#color = Color.find(params[:color])
	#	#size = Size.find(params[:size])
	#end

	def index
		@variants = Variant.all
	end

	def new
		@variant = Variant.new
	end

	def create
		@variant = Variant.new(variant_params)
		@product = Product.find(params[:id])
		@variant.product = @product
		if @variant.save
			flash[:success] = "You have successfully created product variant."
			redirect_to @variant
		else
			render 'new'
		end
	end

	def show
		@variant = Variant.find(params[:id])
		#@variants = Variant.where(brand_id: @variant.brand_id)
	end

	private

	def variant_params
		params.require(:variant).permit(:product, :color, :size, :quantity)
	end
end
