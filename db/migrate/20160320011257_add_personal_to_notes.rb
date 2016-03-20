class AddPersonalToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :personal, :text
  end
end
