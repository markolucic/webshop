class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :size_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
