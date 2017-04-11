class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :product, foreign_key: true, index: true
      t.references :order, foreign_key: true, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end

