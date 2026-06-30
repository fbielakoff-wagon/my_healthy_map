class CreateHealthGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :health_goals do |t|
      t.string :name
      t.string :module
      t.text :content
      t.text :system_prompt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
