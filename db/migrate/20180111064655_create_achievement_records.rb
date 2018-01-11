class CreateAchievementRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :achievement_records do |t|
      t.belongs_to :user, :index => true
      t.belongs_to :achievement, :index => true
      t.timestamps
    end
  end
end
