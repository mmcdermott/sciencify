class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :creator_id, null: false
      t.integer :frequency, default: 1
      t.text :description
      t.boolean :published, default: false
      t.string :name

      t.timestamps
    end
    add_index :metrics, :creator_id
  end
end
