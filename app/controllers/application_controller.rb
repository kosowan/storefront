class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  # @provinces = Province.order(:name)

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    @provinces = Province.order(:name)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :postal_code, :address, :province_id])
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
