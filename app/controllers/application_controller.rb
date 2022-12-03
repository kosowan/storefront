class ApplicationController < ActionController::Base
  before_action :authenticate_customer!
  before_action :initialize_session
  helper_method :cart

  before_action :set_render_order
  before_action :initialize_order
  helper_method :order

  # @provinces = Province.order(:name)

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    @provinces = Province.order(:name)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :postal_code, :address, :province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :postal_code, :address, :province_id])
  end

  def set_render_order
    @render_order = true
  end

  private
  def initialize_order
    @order ||= Order.find_by(id:session[:order_id])

    if customer_signed_in? && @order.nil?
      @order = Order.create(customer_id: current_customer.id)
      session[:order_id] = @order.id
    end
    session[:order] ||= []
  end

  def order
    OrderItem.find(session[:order])
  end


  private
  def initialize_session
    #will initialize the visit count to zero for new users
    session[:shopping_cart] ||= [] #empty array of product IDs
  end

  def cart
    #pass an array of product IDs and get back a collection of products
    Product.find(session[:shopping_cart])
  end

end
