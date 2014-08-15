class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :board_id, null: false
      t.integer :list_id, null: false
      t.string :title, null: false
       
      t.timestamps
    end
    add_index :cards, :title
    add_index :cards, [:board_id, :list_id]
  end
end
