class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
      t.jsonb :fields

      t.timestamps
    end
  end
end
