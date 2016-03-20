# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string
#  poster_path  :string
#  overview     :text
#  release_date :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ActiveRecord::Base
  has_many :notes

  has_many :users, through: :notes

  # attr_accessible movie_attributes: [:id, :title, :poster_path, :overview, :release_date]

  def watched(user)
    self.users.include?(user)
  end
end
