class Category < ActiveRecord::Base
  has_and_belongs_to_many :episodes
  
  validates_uniqueness_of :name
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

