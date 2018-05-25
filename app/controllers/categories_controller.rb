class CategoriesController < ApplicationController
  def index
    @categories = Category.where.not(name: "Soft Drinks")

    authorize @categories
  end

  def show
    @category = Category.friendly.find(params[:id])

    @category_products = @category.products

    authorize @category
  end
end
