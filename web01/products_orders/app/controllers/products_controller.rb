class ProductsController < ApplicationController

  before_action :set_product,only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params

    if @product.save
      flash[:notice] = 'Yay! My product was saved.'
      redirect_to product_path(@product)
    else
      flash[:error] = 'Nay! My product was invalid.'
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:notice] = 'Yay! My product was updated.'
      redirect_to product_path(@product)
    else
      flash[:error] = 'Nay! My product was not updated.'
      render :edit
    end
  end


  def destroy
    if @product.destroy
      flash[:notice] = 'Yay! My product was deleted.'
      redirect_to root_path
    else
      flash[:notice] = 'Yay! My product was deleted.'
      redirect_to root_path
    end

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
