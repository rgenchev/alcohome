class CategoriesController < ApplicationController
  def index
    @categories = Category.where.not(name: ["Liquor", "Absinthe", "Minis"])

    authorize @categories
  end

  def show
    @category = Category.friendly.find(params[:id])

    @category_products = @category.products

    authorize @category
  end
end
