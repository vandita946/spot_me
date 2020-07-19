class CreateCompletionMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :completion_messages do |t|
      t.references :milestone, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
