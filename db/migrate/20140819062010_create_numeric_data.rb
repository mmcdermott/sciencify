class CreateNumericData < ActiveRecord::Migration
  def change
    create_table :numeric_data do |t|
      t.belongs_to :question, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.float :value
      t.boolean :anonymized, default: false
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
