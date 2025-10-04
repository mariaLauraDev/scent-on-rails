class CreateBatchesMaterialsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :batches, :materials do |t|
      t.index [:batch_id, :material_id], unique: true
      t.index [:material_id, :batch_id]
    end
  end
end
