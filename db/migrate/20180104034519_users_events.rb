class UsersEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :users_events, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :events, index: true
    end
  end
end
