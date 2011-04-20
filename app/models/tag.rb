class Tag < ActiveRecord::Base
  has_and_belongs_to_many :episodes
end

# == Schema Information
#
# Table name: tags
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

