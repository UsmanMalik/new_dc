class AddIsAdminGroupToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :is_admin_group, :boolean, default: false
  end
end
