class Enclosure < ActiveRecord::Base
  belongs_to :feed
  belongs_to :episode
end

# == Schema Information
#
# Table name: enclosures
#
#  id         :integer(4)      not null, primary key
#  feed_id    :integer(4)
#  episode_id :integer(4)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

