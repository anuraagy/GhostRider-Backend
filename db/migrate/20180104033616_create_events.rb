class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :winner
      t.string :status
      t.integer :creator_id
      t.timestamps
    end
  end
end
