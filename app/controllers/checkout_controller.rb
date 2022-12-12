class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe and then redirect user to payment screen

    @product = Product.find(params[:id])
    # @order = Order.find(params[:order_id])
    @one = 1

    if @product.nil?
      redirect_to root_path
      return
    end



    # @price = Stripe::Price.create({
    #   unit_amount: @product.price,
    #   currency: 'cad',
    #   # recurring: {interval: 'month'},
    #   product: @product.id,
    # })

    @customer = Stripe::Customer.create({
      description: current_customer.id,
      email: current_customer.email,
      name: current_customer.first_name + " " + current_customer.last_name,
      address: {
        country: "CA",
        postal_code: current_customer.postal_code,
        state: current_customer.province.name,
        line1: current_customer.address

      },
      shipping: {
        address: {
          country: "CA",
          postal_code: current_customer.postal_code,
          state: current_customer.province.name,
          line1: current_customer.address
        },
        name: current_customer.first_name + " " + current_customer.last_name
      }
      # customer_update: [shipping: automatic_tax]

    })

    logger.debug(@customer)

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      customer: @customer,
      shipping_address_collection: {allowed_countries: ['CA']},
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          # name: @product.name,
          # description: @product.description,
          # amount: @product.price,
          # currency: "cad",
          # price: @price,
          price_data: {
            currency: 'cad',
            unit_amount: @product.price,
            product_data: {
              name: @product.name,
              description: @product.description
            }
          },
          quantity: 1, #hard code not good to do...


          # amount: @order.total,
          # currency: "cad"
        },
        {
          price_data: {
            currency: 'cad',
            unit_amount: (@product.price * current_customer.province.gst).to_i,
            product_data: {
              name: "GST",
              description: "Goods and Servies Taxes"
            }
          },
          quantity: 1
        },
        {
          price_data: {
            currency: 'cad',
            unit_amount: (@product.price * current_customer.province.pst).to_i,
            product_data: {
              name: "PST",
              description: "Provincial Sales Tax"
            }
          },
          quantity: 1
        },
        {
          price_data: {
            currency: 'cad',
            unit_amount: (@product.price * current_customer.province.hst).to_i,
            product_data: {
              name: "HST",
              description: "Harmonized Sales Tax"
            }
          },
          quantity: 1
        }
      ],
      # *** auto tax stuff needs to be activated in dashboard/settings/tax/activate ******
      mode: "payment",
      # automatic_tax: {
      #   enabled: true
      # },
      customer_update: {
        shipping: 'auto',
      }
    })
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
