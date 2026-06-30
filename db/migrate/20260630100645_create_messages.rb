class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.string :role
      t.text :content
      t.references :chat, null: false, foreign_key: true
      t.string :attachment_url

      t.timestamps
    end
  end
end
