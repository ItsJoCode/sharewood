class AddCoordinatesToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :latitude, :float
    add_column :sales, :longitude, :float
  end
end
