class CreatePlacings < ActiveRecord::Migration
  def change
    create_table :placings do |t|
      t.references :parent, index: true
      t.integer :place, index: true
      t.references :item, index: true, unique: true

      t.timestamps null: false
    end
    add_foreign_key :placings, :items, column: :parent_id
    add_foreign_key :placings, :items
  end
end
