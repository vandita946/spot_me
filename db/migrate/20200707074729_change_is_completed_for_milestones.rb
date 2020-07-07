class ChangeIsCompletedForMilestones < ActiveRecord::Migration[6.0]
  def change
    change_column_default :milestones, :is_completed, false
  end
end
