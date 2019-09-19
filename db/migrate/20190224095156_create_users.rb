class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_type
      t.string :phone

      t.timestamps
    end
  end
end
