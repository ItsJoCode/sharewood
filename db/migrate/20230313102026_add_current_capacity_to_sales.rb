class AddCurrentCapacityToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :current_capacity, :float, default: 0
  end
end
