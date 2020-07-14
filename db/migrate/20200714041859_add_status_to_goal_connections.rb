class AddStatusToGoalConnections < ActiveRecord::Migration[6.0]
  def change
    add_column :goal_connections, :status, :string, :null => false, :default => "Requested"
  end
end
