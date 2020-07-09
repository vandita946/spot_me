class ChangeStartDateForGoals < ActiveRecord::Migration[6.0]
  def change
    change_column :goals, :start_date, :date
  end
end
