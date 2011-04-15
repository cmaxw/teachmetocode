class Show < ActiveRecord::Base
  has_many :episodes
  has_and_belongs_to_many :feeds
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end

# == Schema Information
#
# Table name: shows
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

