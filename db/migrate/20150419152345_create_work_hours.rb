class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.integer :user_id
      t.date :day
      t.integer :hour

      t.timestamps null: false
    end
  end
end
