class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :store_price
      t.integer :reference
      t.integer :weight
      t.integer :eco_score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
