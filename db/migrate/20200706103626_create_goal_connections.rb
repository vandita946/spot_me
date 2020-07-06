class CreateGoalConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_connections do |t|
      t.references :connection, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
