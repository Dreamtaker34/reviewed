class AddTvshowIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :tvshow_id, :integer
  end
end
