class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :name,         :null => false
      t.string :description,  :null => false
      t.string :image_url,    :null => false
      t.timestamps
    end
  end
end
