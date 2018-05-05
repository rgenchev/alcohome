class StaticPagesController < ApplicationController
	def home
    @arr = Category.all.to_a.sample 3

    @category_random = @arr[0]
    @category_random2 = @arr[1]
    @category_random3 = @arr[2]

    @on_sale_products = Product.order("RANDOM()").on_sale.limit(3)
	end

  def about
  end

  def contact
  end
end
