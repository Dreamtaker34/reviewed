# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  movie_id       :string
#  tvshow_id      :string
#  type           :string
#  title          :string
#  name           :string
#  poster_path    :string
#  overview       :text
#  release_date   :string
#  first_air_date :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Item < ActiveRecord::Base
  has_many :notes
end
