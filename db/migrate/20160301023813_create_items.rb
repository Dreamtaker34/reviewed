class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :movie_id
      t.string :tvshow_id
      t.string :type
      t.string :title
      t.string :name
      t.string :poster_path
      t.text :overview
      t.string :release_date
      t.string :first_air_date

      t.timestamps null: false
    end
  end
end
