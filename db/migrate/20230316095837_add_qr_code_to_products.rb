class AddQrCodeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :qr_code, :string
  end
end
