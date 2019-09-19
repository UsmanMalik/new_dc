class CreateSubmissionAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_attachments do |t|
      t.references :submission, foreign_key: true

      t.timestamps
    end
  end
end
