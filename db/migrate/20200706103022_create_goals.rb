class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.date :deadline
      t.float :progress
      t.string :status

      t.timestamps
    end
  end
end
