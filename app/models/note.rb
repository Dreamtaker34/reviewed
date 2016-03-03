# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  body           :text
#  progress       :string
#  rating         :integer
#  completed      :boolean
#  date_completed :date
#  public         :boolean
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  movie_id       :integer
#  tvshow_id      :integer
#

class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
end
