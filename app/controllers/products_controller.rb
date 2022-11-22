class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
    @categories = Category.order(:name)
    # session[:visit_count]
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.order(:name)
  end
end
