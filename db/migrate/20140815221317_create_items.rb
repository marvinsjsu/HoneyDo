class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :card_id, null: false
      t.string :name, null:false
      t.text :description
    end
    add_index :items, :name
    add_index :items, :card_id
  end
end
