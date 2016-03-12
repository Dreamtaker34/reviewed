class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_path
      t.text :overview
      t.string :release_date

      t.timestamps null: false
    end
  end
end
