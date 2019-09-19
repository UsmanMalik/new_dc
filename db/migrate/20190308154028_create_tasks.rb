class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.jsonb :fields, null: false, default: '{}'
      t.string :title, null: false, limit: 150
      t.text :description
      t.references :user, foreign_key: true


      t.timestamps
    end
      add_index  :tasks, :fields, using: :gin
  end
end
