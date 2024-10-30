class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :status

      t.timestamps
    end
  end
end
