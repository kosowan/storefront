class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @categories = Category.order(:name)
    @category = Category.find(params[:id])
  end
end
