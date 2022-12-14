class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe and then redirect user to payment screen

    # @product = Product.find(params[:id])
    @order = Order.find(params[:id])
    logger.debug(@order.subtotal)
    logger.debug(current_customer.province.gst)
    @items = OrderItem.where(order_id: @order.id)

    # logger.debug(@items)
    # logger.debug(@items.collect { |item| item.json.attributes! })



      @line_items = []
      @items.each do |item|
        @line_items <<
          {
            price_data: {
              currency: 'cad',
              unit_amount: item.listed_price,
              product_data: {
                name: item.product.name,
                description: item.product.description
              }
            },
            quantity: item.quantity
          }

        end


    @line_items <<
    {
      price_data: {
        currency: 'cad',
        unit_amount: (@order.subtotal * current_customer.province.gst).to_i,
        # unit_amount: 100,
        product_data: {
          name: "GST",
          description: "Goods and Servies Taxes"
        }
      },
        quantity: 1
    }

    @line_items <<
    {
      price_data: {
        currency: 'cad',
        unit_amount: (@order.subtotal * current_customer.province.pst).to_i,
        # unit_amount: 100,
        product_data: {
          name: "PST",
          description: "Provincial Sales Tax"
        }
      },
      quantity: 1
    }

    @line_items <<
    {
      price_data: {
        currency: 'cad',
        unit_amount: (@order.subtotal * current_customer.province.hst).to_i,
        # unit_amount: 100,
        product_data: {
          name: "HST",
          description: "Harmonized Sales Tax"
        }
      },
      quantity: 1
    }

    @one = 1

    if @order.nil?
      redirect_to root_path
      return
    end

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
    })

    logger.debug(@customer)
    # debugger.log()
    logger.debug(@items.each do |item| item.product.name end)



    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      customer: @customer,
      shipping_address_collection: {allowed_countries: ['CA']},
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      line_items: @line_items,
    #   line_items: [

    #     # @items.each do |item|
    #     #   line_items <<
    #     # end
    #     #   {
    #     #     price_data: {
    #     #       currency: 'cad',
    #     #       unit_amount: item.listed_price,
    #     #       product_data: {
    #     #         name: item.product.name,
    #     #         description: item.product.description
    #     #       }
    #     #     },
    #     #     quantity: item.quantity
    #     #   },

    #     line_items

    #      {
    #       price_data: {
    #         currency: 'cad',
    #         unit_amount: (@order.subtotal * current_customer.province.gst).to_i,
    #         # unit_amount: 100,
    #         product_data: {
    #           name: "GST",
    #           description: "Goods and Servies Taxes"
    #         }
    #       },
    #       quantity: 1
    #     },
    #     {
    #       price_data: {
    #         currency: 'cad',
    #         unit_amount: (@order.subtotal * current_customer.province.pst).to_i,
    #         # unit_amount: 100,
    #         product_data: {
    #           name: "PST",
    #           description: "Provincial Sales Tax"
    #         }
    #       },
    #       quantity: 1
    #     },
    #     {
    #       price_data: {
    #         currency: 'cad',
    #         unit_amount: (@order.subtotal * current_customer.province.hst).to_i,
    #         # unit_amount: 100,
    #         product_data: {
    #           name: "HST",
    #           description: "Harmonized Sales Tax"
    #         }
    #       },
    #       quantity: 1
    #     }

    #     # {
    #     #   price_data: {
    #     #     currency: 'cad',
    #     #     unit_amount: @product.price,
    #     #     product_data: {
    #     #       name: @product.name,
    #     #       description: @product.description
    #     #     }
    #     #   },
    #     #   quantity: 1, #hard code not good to do...
    #     # },
    #     # {
    #     #   price_data: {
    #     #     currency: 'cad',
    #     #     unit_amount: (@product.price * current_customer.province.gst).to_i,
    #     #     product_data: {
    #     #       name: "GST",
    #     #       description: "Goods and Servies Taxes"
    #     #     }
    #     #   },
    #     #   quantity: 1
    #     # },
    #     # {
    #     #   price_data: {
    #     #     currency: 'cad',
    #     #     unit_amount: (@product.price * current_customer.province.pst).to_i,
    #     #     product_data: {
    #     #       name: "PST",
    #     #       description: "Provincial Sales Tax"
    #     #     }
    #     #   },
    #     #   quantity: 1
    #     # },
    #     # {
    #     #   price_data: {
    #     #     currency: 'cad',
    #     #     unit_amount: (@product.price * current_customer.province.hst).to_i,
    #     #     product_data: {
    #     #       name: "HST",
    #     #       description: "Harmonized Sales Tax"
    #     #     }
    #     #   },
    #     #   quantity: 1
    #     # }
    # ] << @items,
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
    @session = Stripe::Checkout::Session.retrieve(id: params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    logger.debug("Payment intent id: #{@payment_intent.id}")

    Order.update(@order.id, :stripe_payment_id => @payment_intent.id,
                            :address => @payment_intent.shipping.address.line1,
                            :postal_code => @payment_intent.shipping.address.postal_code,
                            :province => @payment_intent.shipping.address.state,
                            :status => @payment_intent.status)
    # :status => @payment_intent.status

  end

  def cancel
    #something went wrong with payment
    # if @session.paid = false
    #   redirect_to root_path
    # end

  end
end
