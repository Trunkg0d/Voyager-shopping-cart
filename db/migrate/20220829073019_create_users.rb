class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar, default: "http://cdn.shopify.com/s/files/1/0612/1085/3627/products/CatPirate_DIN_LQ_1200x1200.jpg?v=1638441950"
      t.string :phone
      t.string :address
      t.integer :role, default: 1
      t.string :password_digest
      t.timestamps
    end
  end
end
