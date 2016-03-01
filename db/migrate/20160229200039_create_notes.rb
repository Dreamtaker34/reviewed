class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.string :progress
      t.integer :rating
      t.boolean :completed
      t.date :date_completed
      t.boolean :public
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
