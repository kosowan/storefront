class HomeController < ApplicationController
  def index
    @categories = Category.order(:name)
    @products = Product.order(:name).page(params[:page])
    #session stuff
    # session[:visit_count] ||= 0 #default value 0
    # session[:visit_count] += 1
    # @visit_count = session[:visit_count]
  end
end
