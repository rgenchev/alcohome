class AddOnSalePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :on_sale_price, :decimal
  end
end
