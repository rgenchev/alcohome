class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    authorize @categories
  end

  def show
    @category = Category.find(params[:id])

    authorize @category
  end
end
