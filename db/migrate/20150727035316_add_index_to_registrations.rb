class AddIndexToRegistrations < ActiveRecord::Migration
  def change
    add_index :registrations, [:user_id, :metric_id], unique: true
  end
end
