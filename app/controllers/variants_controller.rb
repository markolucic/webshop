class VariantsController < ApplicationController
	before_action :set_variant, only: [:show, :edit, :update, :destroy]
	before_action :set_product
	

	def index
		@variants = Variant.all
	end

	def new
		@variant = Variant.new
		@colors = Color.order(:name)
		@sizes = Size.order(:size)
	end

	def create
		@variant = Variant.new(variant_params)
		@variant.product = @product
		if @variant.save
			flash[:success] = "You have successfully created product variant."
			redirect_to @variant
		else
			@colors = Color.order(:name)
			@sizes = Size.order(:size)
			render 'new'
		end
	end

	def show
		@variant = Variant.find(params[:id])
		#@variants = Variant.where(brand_id: @variant.brand_id)
	end


	private

	def variant_params
		params.require(:variant).permit(:product_id, :color_id, :size_id, :quantity)
	end
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

end