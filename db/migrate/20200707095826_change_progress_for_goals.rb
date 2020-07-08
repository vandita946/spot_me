class ChangeProgressForGoals < ActiveRecord::Migration[6.0]
  def change
    change_column_default :goals, :progress, 0.0
  end
end
