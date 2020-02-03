class CreateDetailBills < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_bills do |t|
      t.references :bill, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :count
      t.integer :price_all

      t.timestamps
    end
  end
end
