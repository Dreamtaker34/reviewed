class AddSharedToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :shared, :text
  end
end
