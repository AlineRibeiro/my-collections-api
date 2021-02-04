class CreateCollectionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_items do |t|
      t.string :name
      t.string :description
      t.string :maker
      t.monetize :price_paid
      t.monetize :current_value
      t.string :serial_number
      t.string :origin
      t.integer :circa
      t.integer :condition
      t.boolean :signed
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
