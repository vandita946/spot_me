class ChangeStartDateForGoals < ActiveRecord::Migration[6.0]
  def change
    change_column_default :goals, :start_date, Date.today
  end
end
