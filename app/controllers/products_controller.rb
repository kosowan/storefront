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

  def search
    wildcard_search = "%#{params[:keywords]}%"

    @products = Product.where("name LIKE ?", wildcard_search)
  end
end
