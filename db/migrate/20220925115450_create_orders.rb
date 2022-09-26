class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :item_prefecture_id
      t.string :city
      t.string :building
      t.string :addresses
      t.string :phone_number
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
