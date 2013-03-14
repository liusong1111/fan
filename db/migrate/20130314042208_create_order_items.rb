class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :food_id
      t.string :user_name
      t.text :description

      t.timestamps
    end
  end
end
