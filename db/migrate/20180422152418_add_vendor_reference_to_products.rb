class AddVendorReferenceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :vendor, index: true
  end
end
