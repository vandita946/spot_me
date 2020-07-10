class AddIconsToGoal < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :icon, :string

  end
end
