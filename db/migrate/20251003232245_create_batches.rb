class CreateBatches < ActiveRecord::Migration[8.0]
  def change
    create_table :batches do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.string :status

      t.timestamps
    end
  end
end
