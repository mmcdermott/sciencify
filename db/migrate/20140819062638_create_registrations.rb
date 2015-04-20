class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :metric, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.integer :frequency, default: 1
      t.date :expiration_date
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
