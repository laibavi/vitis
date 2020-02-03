class RemoveImageColumnFromPictures < ActiveRecord::Migration[5.2]
  def change
      remove_column :pictures, :image
  end
end
