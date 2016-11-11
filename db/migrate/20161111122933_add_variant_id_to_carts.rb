class AddVariantIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :variant_id, :integer
  end
end
