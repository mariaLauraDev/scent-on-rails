class CreateInterviewees < ActiveRecord::Migration[8.0]
  def change
    create_table :interviewees do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :sector

      t.timestamps
    end
  end
end
