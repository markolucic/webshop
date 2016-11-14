class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true, foreign_key: true, on_delete: :cascade
      t.references :variant, index: true, foreign_key: true, on_delete: :cascade
      t.references :user, index: true, foreign_key: true, on_delete: :cascade
      t.integer :quantity
      t.decimal :price

      t.timestamps null: false
    end
  end
end
