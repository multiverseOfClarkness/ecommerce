class ProductsController < ApplicationController
  before_action :validate_role, except: [:index, :show]
  
  

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end  

  
  def new
    @product = Product.new
  end
  
  
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end  

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path, status: :see_other
  end

  def to_cart

  end  

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end

  def validate_role
    unless current_user&.role_id == 1
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

end
