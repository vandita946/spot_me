class ChangeTableUsers < ActiveRecord::Migration[6.0]
    def change
    change_table :users do |t|
      t.rename :name, :firstname
      t.string :lastname
    end
  end
end
