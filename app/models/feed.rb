class Feed < ActiveRecord::Base
  has_many :enclosures
  has_and_belongs_to_many :shows
  
  validates_uniqueness_of :slug
  validates_presence_of :slug

  def episodes
    Episode.joins("JOIN feeds_shows ON feeds_shows.show_id = episodes.show_id").where("feeds_shows.feed_id = #{self[:id]}").order("episodes.published_at DESC")
  end
  
  def to_param
    self.slug
  end
end


# == Schema Information
#
# Table name: feeds
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

