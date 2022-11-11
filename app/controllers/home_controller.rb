class HomeController < ApplicationController
  def index
    @categories = Category.order(:name)
    @products = Product.order(:name)
  end
end
