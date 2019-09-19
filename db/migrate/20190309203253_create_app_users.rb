class CreateAppUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :app_users do |t|
      t.references :user, foreign_key: true
      t.integer :client_admin_id
      t.integer :status
      t.string :auth_token

      t.timestamps
    end
  end
end
