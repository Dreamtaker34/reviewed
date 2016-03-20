class RemoveBodyFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :body, :text
  end
end
