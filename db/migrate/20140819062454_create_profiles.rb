class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, null: false
      t.string :nickname
      t.text :bio

      t.timestamps
    end
  end
end
