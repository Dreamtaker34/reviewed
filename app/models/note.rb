# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  progress       :string
#  rating         :integer
#  completed      :boolean
#  date_completed :date
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  movie_id       :integer
#  tvshow_id      :integer
#  personal       :text
#  shared         :text
#

class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  belongs_to :tvshow

  accepts_nested_attributes_for :movie, :tvshow

end
