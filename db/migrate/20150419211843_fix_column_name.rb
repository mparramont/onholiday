class FixColumnName < ActiveRecord::Migration
  def change
   rename_column :users, :martial_status, :marital_status
   rename_column :users, :telephone_mobil, :mobile_phone
   remove_column :users, :degree
  end
end
