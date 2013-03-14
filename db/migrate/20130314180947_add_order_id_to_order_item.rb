class AddOrderIdToOrderItem < ActiveRecord::Migration
  def change
    change_table :order_items do |t|
      t.integer :order_id
    end
  end
end
