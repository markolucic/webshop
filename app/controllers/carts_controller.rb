class CartsController < ApplicationController
  before_action :logged_in_user

  def add
    quantity = params[:quantity]
    color = params[:color]
    size = params[:size]
    @product_item = @current_user.carts.where("product_id = ? AND size = ? AND color = ?", 
                                              params[:id], size.to_i, color).first
    if @product_item
      @product_item.quantity = @product_item.quantity + quantity.to_i
      @product_item.size = size.to_i
      @product_item.color = color
      @product_item.save
    else
      item = Cart.new
      item.user = @current_user
      item.product = Product.find(params[:id])
      item.size = size.to_i
      item.color = color
      item.quantity = quantity.to_i
      item.save
    end
    if params[:commit] == "ADD TO CART"
      redirect_to '/products/' << params[:id]
    else
      redirect_to cart_path
    end
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

  def checkout
    @addresses = @current_user.addresses
    @address = Address.new
  end

  def place_order
    @address = Address.find(params[:address_id])
  end

  def create_charge
      tmp = @current_user.total_price * 100 #cents
      @amount = tmp.to_i

      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'ABHShoes order',
      :currency    => 'usd'
    )
    update_products
    #send email to the user, basic order info
    @current_user.send_orders_email
    @current_user.carts.delete_all

  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def update_products
    products = @current_user.carts
    products.each do |p|
      tmp = Product.find_by_id(p.product_id)
      tmp.quantity -= p.quantity if (tmp.quantity-p.quantity)>=0
      tmp.save
    end
  end

  def create_address
    @address = Address.new(address_params)
    @address.user = @current_user
    @address.save
    redirect_to "/cart/place_order?address_id=#{@address.id}"
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

  private

  def address_params
     params.require(:address).permit(:full_name, :address, :city, :state, :zip, :country, :phone_number, :user_id)
  end
  
end
