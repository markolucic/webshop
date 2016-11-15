class CartsController < ApplicationController
  before_action :logged_in_user

  def add
    quantity = params[:quantity]
    color = params[:color]
    size = params[:size]
    color_id = Color.where(name: color).first.id
    size_id = Size.where(size: size).first.id

    #@product_item = @current_user.carts.where("product_id = ? AND size = ? AND color = ?", 
                                              #params[:id], size.to_i, color).first
    #ovdje ide variant_id
    @variant = Variant.where("product_id = ? AND size_id = ? AND color_id = ?", 
                                              params[:id], size_id.to_i, color_id).first
    @product_item = @current_user.carts.where("variant_id = ? ", @variant.id).first
    #byebug
    if @product_item
      @product_item.quantity += quantity.to_i
      size=Size.find(size_id)
      color=Color.find(color_id)
      @product_item.variant.size = size
      @product_item.variant.color = color
      if @product_item.variant.quantity < quantity.to_i
         if @product_item.variant.quantity == 0
           flash[:danger] = "Item out of stock!"
         else
           flash[:danger] = "There are only #{@product_item.variant.quantity} items left."
         end
         redirect_to '/products/' << params[:id]
         return
       else
         @product_item.quantity = quantity.to_i
         @product_item.save
       end
      
    else
      item = Cart.new
      item.user = @current_user
      item.product = Product.find(params[:id])
      variant = Variant.where("product_id = ? AND size_id = ? AND color_id = ?", params[:id], size_id.to_i, color_id).first
      item.variant = variant
      
      if item.variant.quantity < quantity.to_i
         if item.variant.quantity == 0
           flash[:danger] = "Item out of stock!"
         else
           flash[:danger] = "There are only #{item.variant.quantity} items left."
         end
         redirect_to '/products/' << params[:id]
         return
       else
         item.quantity = quantity.to_i
         item.save
       end
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
    if @current_user.total_price == 0
      flash[:warning] = "Your cart is empty!"
      redirect_to '/cart/checkout'
    end
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
    #save the order information
    save_order
    #empty cart
    @current_user.carts.delete_all

  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def save_order
    products = @current_user.carts
    products.each do |p|
      pr = Product.find_by_id(p.product_id)
      o = Order.new(product_id: p.product_id, user_id: @current_user.id, quantity: p.quantity, price: p.quantity*pr.price)
      o.save
    end
  end

  def update_products
    products = @current_user.carts
    products.each do |p|
      variant = Variant.find(p.variant_id)
      variant.quantity -= p.quantity
      variant.save
    end
  end

  def create_address
    @address = Address.new(address_params)
    @address.user = @current_user
    @current_user.addresses << @address

    if @address.save
      redirect_to "/cart/place_order?address_id=#{@address.id}"
    else
      flash[:danger] = @address.errors.full_messages.first
      redirect_to "/cart/checkout"
    end
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
     params.require(:address).permit(:id, :full_name, :address, :city, :state, :zip, :country, :phone_number, :user_id)
  end
  
end
