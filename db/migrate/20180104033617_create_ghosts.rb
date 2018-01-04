class CreateGhosts < ActiveRecord::Migration[5.1]
  def change
    create_table :ghosts do |t|
      t.string  :name, :null => false
      t.integer :distance
      t.string  :status
      t.integer :time
      t.integer :calories_burned
      
      t.json    :data

      t.belongs_to :users
      t.belongs_to :events

      t.timestamps
    end
  end
end
