class CreateBatchesQuestionsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :batches, :questions do |t|
      t.index [:batch_id, :question_id], unique: true
      t.index [:question_id, :batch_id]
    end
  end
end
