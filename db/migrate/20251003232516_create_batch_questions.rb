class CreateBatchQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :batch_questions do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
