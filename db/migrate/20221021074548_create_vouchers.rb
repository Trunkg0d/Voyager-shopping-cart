class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.references :shop
      t.integer :percent, default: 0
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
