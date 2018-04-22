class AddSlugToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :slug, :string
    add_index :vendors, :slug, unique: true
  end
end
