class Movie < ActiveRecord::Base
  has_many :notes

  # attr_accessible movie_attributes: [:id, :title, :poster_path, :overview, :release_date]
end
