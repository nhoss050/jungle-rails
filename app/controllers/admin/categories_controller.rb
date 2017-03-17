class Admin::CategoriesController < ApplicationController

 http_basic_authenticate_with name: ENV[ 'http_basic_auth_username'], password: ENV['http_basic_auth_password']
# http_basic_authenticate_with name: 'Jungle', password: 'book'

  def index
    @categories = Category.order(id: :desc).all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
