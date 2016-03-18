class Movie < ActiveRecord::Base
  has_many :notes

  has_many :users, through: :notes

  # attr_accessible movie_attributes: [:id, :title, :poster_path, :overview, :release_date]

  def watched(user)
    self.users.include?(user)
  end
end
