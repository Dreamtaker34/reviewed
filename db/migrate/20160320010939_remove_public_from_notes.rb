class RemovePublicFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :public, :boolean
  end
end
