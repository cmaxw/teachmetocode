class Show < ActiveRecord::Base
  has_many :episodes
  has_and_belongs_to_many :feeds
  
  has_attached_file :image, :styles => {:itunes => "600x600", :small => "300x300", :mini => "150x150"}
end


# == Schema Information
#
# Table name: shows
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  slug               :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  description        :text
#

