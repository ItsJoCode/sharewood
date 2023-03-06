class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :address
      t.integer :sale_capacity
      t.datetime :end_date
      t.integer :price_reduction
      t.integer :progress
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
