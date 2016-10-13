class CartsController < ApplicationController
  before_action :logged_in_user

  def add
    @product_item = @current_user.carts.where("product_id = ?", params[:id]).first
    quantity = params[:quantity]
    size = params[:size]
    color = params[:color]
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

  def remove
    id = params[:id]
    @current_user.carts.delete(id)
    redirect_to cart_path
  end

  def clear

    @current_user.carts.delete_all 
    redirect_to cart_path
  end

  def index
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
