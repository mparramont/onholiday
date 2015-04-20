class AddEmployeeDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :degree, :string
    add_column :users, :position, :string
    add_column :users, :telephone_work, :string
    add_column :users, :telephone_mobil, :string
    add_column :users, :telephone_home, :string
    add_column :users, :martial_status, :string
  end
end
