class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :name
      t.date :deadline
      t.boolean :is_completed
      t.integer :weightage

      t.timestamps
    end
  end
end
