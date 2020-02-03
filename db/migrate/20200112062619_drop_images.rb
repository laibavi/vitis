class DropImages < ActiveRecord::Migration[5.2]
  def change
      remove_foreign_key :picture_products, :pictures
      drop_table :picture_products
      drop_table :pictures
  end
end
