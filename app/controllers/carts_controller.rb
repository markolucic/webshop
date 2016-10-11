class CartsController < ApplicationController
  before_action :logged_in_user

  def add
    
  	#id = params[:id]
  	# if the cart has already been created, use existing one, else create a new cart
  	#if session[:cart] then
  	#	cart = session[:cart]
  	#else
  	#	session[:cart] = {}
  	#	cart = session[:cart]
  	#end
  	# if the product has already been added to cart, increment the value, else set it
  	#if cart[id] then
  	#	cart[id] = cart[id] + 1
  	#else
  	#	cart[id] = 1
  	#end
    @product_item = @current_user.carts.where("product_id = ?", params[:id]).first
    quantity = params[:quantity]
    size = params[:size]
    if @product_item
      @product_item.quantity = @product_item.quantity + quantity.to_i
      #product size and color
      @product_item.save
    else
      item = Cart.new
      item.user = @current_user
      item.product = Product.find(params[:id])
      item.quantity = quantity.to_i
      item.save
    end

  	redirect_to cart_path
  end

  def clear
  	#session[:cart] = nil
  	
    @current_user.carts.delete_all 
    redirect_to cart_path
  end

  def index
  	# if cart exist, pass it to the view else pass an empty value
  	#if session[:cart] then
  	#	@cart = session[:cart]
  	#else
  	#	@cart = {}
  	#end
    @cart_items = @current_user.carts.order(:id)
  end

  def set_quantity
    cart_item = @current_user.carts.find(params[:cart_id])
    quantity = params[:quantity]
    
    cart_item.quantity = quantity
    cart_item.save()

    redirect_to :action => :index
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You must be logged in!"
      redirect_to login_path
    end
  end
  
end
