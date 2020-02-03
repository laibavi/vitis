class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.date :date_delivery
      t.boolean :status
      t.integer :total_price

      t.timestamps
    end
  end
end
