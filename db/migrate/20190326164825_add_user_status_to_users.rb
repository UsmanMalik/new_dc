class AddUserStatusToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :user_status, :integer, default: 0
  end
  def down 
    remove_column :users, :user_status
  end
end
