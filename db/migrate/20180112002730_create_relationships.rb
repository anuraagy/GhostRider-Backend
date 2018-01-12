class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.belongs_to  :user,      :index => true, :null => false
      t.integer     :friend_id, :index => true, :null => false

      t.timestamps
    end
  end
end
