class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :on_sale, :boolean, default: false
    add_column :products, :sale_price, :decimal
    add_column :products, :start_date, :date
    add_column :products, :end_date, :date
  end
end
