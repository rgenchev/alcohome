class CategoriesController < ApplicationController
  def index
    @categories = Category.where.not(name: ["Soft", "Spirits", "Minis"])

    authorize @categories
  end

  def show
    @category = Category.friendly.find(params[:id])

    @category_products = @category.products

    authorize @category
  end
end
