class AddPhotoPathToItem < ActiveRecord::Migration
  def change
    add_column :items, :photo_path, :string
  end
end
