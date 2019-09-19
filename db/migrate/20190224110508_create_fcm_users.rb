class CreateFcmUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :fcm_users do |t|
      t.references :user
      t.string :fcm_key

      t.timestamps
    end
  end
end
