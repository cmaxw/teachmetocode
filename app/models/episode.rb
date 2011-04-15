class Episode < ActiveRecord::Base
  belongs_to :show
  has_many :enclosures
end

# == Schema Information
#
# Table name: episodes
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  show_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

