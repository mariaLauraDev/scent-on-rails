class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.references :interview, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.text :value
      t.string :response_type

      t.timestamps
    end
  end
end
