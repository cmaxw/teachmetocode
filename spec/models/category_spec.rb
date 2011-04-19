require 'spec_helper'

describe Category do
  before :all do
    Factory.create(:category)
  end
  
  it { should validate_uniqueness_of(:name)}
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

