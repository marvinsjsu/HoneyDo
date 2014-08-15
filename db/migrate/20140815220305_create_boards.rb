class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.string :created_by
      
      t.timestamps
    end
    add_index :boards, :title
  end
end
