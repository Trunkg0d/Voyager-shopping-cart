class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shop
      t.string :name
      t.string :color
      t.string :size
      t.integer :price
      t.integer :quantity_remain
      t.text :description
      t.string :image
      t.timestamps
    end
    add_index :products, [:shop_id, :created_at]
  end
end
