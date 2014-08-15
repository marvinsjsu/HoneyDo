class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :board_id, null: false
      t.string :title, null: false
     
      t.timestamps
    end
    add_index :lists, :board_id
    add_index :lists, :title
  end
end
