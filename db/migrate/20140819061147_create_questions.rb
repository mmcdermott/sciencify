class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :answer_type
      t.text :question
      t.string :input_label
      t.belongs_to :metric, index: true

      t.timestamps
    end
  end
end
