class CreateVacationRequests < ActiveRecord::Migration
  def change
    create_table :vacation_requests do |t|
      t.date :start
      t.date :end
      t.string :reason
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
