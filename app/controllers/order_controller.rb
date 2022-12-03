class OrderController < ApplicationController
  def show
    @render_order = false
  end

  def add
    logger.debug("Adding #{params[:id]} #{params[:quantity]} to cart.")

    id = params[:id]
    #@product = Product.find_by(id: params[:id])
    quantity = params[:quantity]
    #product = Product.find(id)
    product = Product.find_by(id: params[:id])
    order = @order.id

    logger.debug("product: #{product} order: #{order}")
    logger.debug("quantity: #{quantity}")

    # orderitem = OrderItem.create(quantity: quantity, listed_price: product.price, order_id: order, product_id: id)

    # logger.debug("order item: #{orderitem}")

    # orderItemId = orderitem.id

    # session[:order] << orderItemId

    # # flash[:notice] = "➕ #{orderitem} added to cart."
    # flash[:notice] = "#{orderitem.quantity} #{orderitem.product.name} added to cart."
    # redirect_to root_path

    this_order_item = @order.order_items.find_by(id: params[:id])

    #logger.debug("thisorderitem: #{this_order_item.id}")

    if this_order_item && quantity.to_i > 0 #orderitem exists and quantity > 0
      this_order_item.update(quantity: quantity)
      redirect_to root_path
    elsif quantity.to_i <= 0 #quantity <= 0
      #this_order_item.destroy #destroy
      OrderItem.find_by(id: params[:id]).destroy

      id = params[:id].to_i
      session[:order].delete(id)
      # product = Product.find(id)
      redirect_to root_path
      # flash[:notice] = "➖ #{product.name} removed from cart."
    else
      #create
      orderitem = OrderItem.create(quantity: quantity, listed_price: product.price, order_id: order, product_id: id)

      logger.debug("order item: #{orderitem}")

      orderItemId = orderitem.id

      session[:order] << orderItemId

      # flash[:notice] = "➕ #{orderitem} added to cart."
      flash[:notice] = "#{orderitem.quantity} #{orderitem.product.name} added to cart."
      redirect_to root_path
    end



    # @product = Product.find_by(id: params[:id])
    # quantity = params[:quantity]
    # current_order_item = @order.order_items.find_by(product_id: @product.id)
    # logger.debug(current_order_item.to_s)

    # if current_order_item && quantity > 0
    #   current_order_item.update(quantity:)
    # elsif quantity <= 0
    #   current_order_item.destroy
    # else
    #   @order.order_item.create(product: @product, quantity:, listed_price: @product.price)
    # end

    # @order.order_item.create(product: @product, quantity:, listed_price: @product.price)

  end

  def remove
    OrderItem.find_by(id: params[:id]).destroy

    id = params[:id].to_i
    session[:order].delete(id)
    # product = Product.find(id)
    redirect_to root_path
    # flash[:notice] = "➖ #{product.name} removed from cart."
  end

end
