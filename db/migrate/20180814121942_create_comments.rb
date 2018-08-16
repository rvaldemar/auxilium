class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :votes
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true
      t.boolean :is_answer
      t.boolean :is_hint

      t.timestamps
    end
  end
end
