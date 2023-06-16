class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
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
    @cart = current_user.cart || current_user.create_cart
    @product = Product.find(params[:product_id])
    @cart.line_items.create(product: @product)
    redirect_to cart_path, notice: 'Item added to cart.'
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

