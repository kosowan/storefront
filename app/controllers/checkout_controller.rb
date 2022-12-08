class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe and then redirect user to payment screen

    # @product = Product.find(params[:id])
    @order = Order.find(params[:order_id])

    if @order.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: [:card],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          # name: @product.name,
          # description: @product.description,
          # amount: @product.price,
          # currency: "cad",
          # quantity: 1 #hard code not good to do...

          amount: @order.total
          currency: "cad"
        }
      ]
    )
    # respond_to do |format|
    #   format.js # render app/views/checkout/create.js.erb
    # end
    redirect_to @session.url, allow_other_host: true

  end

  def success
    # we took the customer's money

  end

  def cancel
    #something went wrong with payment

  end
end
