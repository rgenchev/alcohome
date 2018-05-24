class StaticPagesController < ApplicationController
	def home
    @categories = Category.where.not(name: "Soft Drinks")
    @arr = @categories.to_a.sample 3

    @category_random = @arr[0]
    @category_random2 = @arr[1]
    @category_random3 = @arr[2]

    @on_sale_products = Product.order("RANDOM()").on_sale.limit(3)
	end

  def about_us
  end

  def contact
  end

  def terms_of_service
  end
end
