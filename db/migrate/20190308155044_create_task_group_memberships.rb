class CreateTaskGroupMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :task_group_memberships do |t|
      t.references :task, foreign_key: true
      t.references :group, index: true
      t.timestamps
    end
  end
end
