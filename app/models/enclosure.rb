require "mime/types"

class Enclosure < ActiveRecord::Base
  belongs_to :feed
  belongs_to :episode
  
  before_save :set_size
  
  def set_size
    if self.size.blank?
      uri = URI.parse(self.url)
      http = Net::HTTP.new(uri.host)
      response = http.request_head(uri.path.blank? ? "/" : uri.path)
      self.size = response['content-length'] || "0"
      self.mime = uri.path.match(/.m4v$/) ? "video/x-m4v" : MIME::Types.type_for(uri.path).first.content_type
    end
  end
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

