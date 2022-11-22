class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    product = Product.find(id)
    session[:shopping_cart] << id #push id to end of array
    flash[:notice] = " #{product.name} added to cart."
    redirect_to root_path

  end

  def destroy

  end
end
