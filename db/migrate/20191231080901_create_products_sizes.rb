class CreateProductsSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :products_sizes do |t|
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true
    end
  end
end
