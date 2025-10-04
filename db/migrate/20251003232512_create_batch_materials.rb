class CreateBatchMaterials < ActiveRecord::Migration[8.0]
  def change
    create_table :batch_materials do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
