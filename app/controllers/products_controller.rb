class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page])
    @categories = Category.order(:name)
    # session[:visit_count]
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.order(:name)
  end

  def search
    @categories = Category.order(:name)

    wildcard_search = "%#{params[:keywords]}%"
    category_select = "%#{params[:category_select]}%"

    if (category_select.nil?)
      @products = Product.where("name LIKE ?", wildcard_search).or(Product.where("description LIKE ?", wildcard_search))
    else
      @products = Product.where("name LIKE ?", wildcard_search).where("category_id LIKE ?", category_select)
      .or(Product.where("description LIKE ?", wildcard_search).where("category_id LIKE ?", category_select))
    end
  end

  def new
    # today = Date.today
    # three_days_ago = Date.today - 3.days.ago..
    @products = Product.where(created_at: 3.days.ago..)
  end

  def sale
    # no_sale_id = Sale.where("sale_percentage IS ?", 1)

    # no_sale_id = Sale.find(1)

    no_sale_id = Sale.find_by sale_percentage: 1.to_d
    logger.debug("no_sale_id #{no_sale_id}")

    @products = Product.where("sale_id != ?", no_sale_id)
  end

end
