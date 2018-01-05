class CreateGhosts < ActiveRecord::Migration[5.1]
  def change
    create_table :ghosts do |t|
      t.string  :name, :null => false
      t.string  :status
      t.decimal :distance
      t.decimal :time
      t.integer :calories_burned
      
      t.json    :data

      t.belongs_to :user, :index => true
      t.belongs_to :event, :index => true

      t.timestamps
    end
  end
end
