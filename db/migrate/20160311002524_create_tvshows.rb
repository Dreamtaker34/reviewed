class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|
      t.string :name
      t.string :poster_path
      t.text :overview
      t.string :first_air_date

      t.timestamps null: false
    end
  end
end
