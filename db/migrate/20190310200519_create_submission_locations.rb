class CreateSubmissionLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_locations do |t|
      t.references :submission, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
