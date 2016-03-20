# == Schema Information
#
# Table name: tvshows
#
#  id             :integer          not null, primary key
#  name           :string
#  poster_path    :string
#  overview       :text
#  first_air_date :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Tvshow < ActiveRecord::Base
  has_many :notes
end
