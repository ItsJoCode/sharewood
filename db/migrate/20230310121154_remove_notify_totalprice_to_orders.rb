class RemoveNotifyTotalpriceToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :total_price
    remove_column :orders, :notify
  end
end
