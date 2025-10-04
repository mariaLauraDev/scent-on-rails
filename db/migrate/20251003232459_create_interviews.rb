class CreateInterviews < ActiveRecord::Migration[8.0]
  def change
    create_table :interviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true
      t.datetime :interview_date
      t.text :notes
      t.string :status

      t.timestamps
    end
  end
end
