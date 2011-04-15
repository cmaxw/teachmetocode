class Feed < ActiveRecord::Base
  has_many :enclosures
  has_and_belongs_to_many :shows
end

# == Schema Information
#
# Table name: feeds
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

