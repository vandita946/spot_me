class ChangeIconsForGoals < ActiveRecord::Migration[6.0]
  def change
    change_column_default :goals, :icon, "<i class='fa fa-trophy'></i>"

  end
end
