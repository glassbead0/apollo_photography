class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
      t.integer :width
      t.integer :height
      t.string :print_type
      t.integer :quantity

      t.timestamps
    end
  end
end
