class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @line_items = @cart.line_items.includes(:product) if @cart.present?
  end
  
  

  def update
    @cart = current_user.cart
    if @cart.update(cart_params)
      redirect_to cart_path, notice: 'Cart updated successfully.'
    else
      render :show
    end
  end

  def add_item
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i
  
    # Check if the current user has a cart, create one if not
    cart = current_user.cart || current_user.create_cart
  
    if quantity > 0
      line_item = cart.line_items.find_or_initialize_by(product_id: product.id)
  
      line_item.quantity += quantity
      line_item.save
    end
  
    redirect_to cart_path
  end
  
  

  
  def remove_item
    @cart = current_user.cart
    @line_item = @cart.line_items.find(params[:line_item_id])
    @line_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart.'
  end

  private

  def cart_params
    # Define any permitted parameters for the cart update
    params.require(:cart).permit(:id)
  end
end

