class AddStartDateToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :start_date, :date
  end
end
