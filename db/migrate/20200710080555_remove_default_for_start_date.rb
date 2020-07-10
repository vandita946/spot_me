class RemoveDefaultForStartDate < ActiveRecord::Migration[6.0]
  def change
    change_column_default :goals, :start_date, nil
  end
end
