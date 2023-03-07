class AddPhotoUrlToCreators < ActiveRecord::Migration[7.0]
  def change
    add_column :creators, :photo_url, :string
  end
end
