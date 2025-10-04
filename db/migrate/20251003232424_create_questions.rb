class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.text :text
      t.string :question_type
      t.text :options

      t.timestamps
    end
  end
end
