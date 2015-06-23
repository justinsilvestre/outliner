class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.text :note
      t.boolean :completed, default: false
      t.boolean :expanded, default: true

      t.timestamps null: false
    end
  end
end
