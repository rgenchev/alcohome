class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    authorize @categories
  end

  def show
    @category = Category.friendly.find(params[:id])

    authorize @category
  end
end
