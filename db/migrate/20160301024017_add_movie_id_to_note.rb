class AddMovieIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :movie_id, :integer
  end
end
