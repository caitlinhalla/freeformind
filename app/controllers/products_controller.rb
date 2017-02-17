class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:notice] = "Product Saved"
      redirect_to products_path
    else
      flash[:alert] = "Unable to save product"
      render :new
    end
  end

  def edit

  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
