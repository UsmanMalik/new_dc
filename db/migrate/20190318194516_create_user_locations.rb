class CreateUserLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_locations do |t|
      t.references :user, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
