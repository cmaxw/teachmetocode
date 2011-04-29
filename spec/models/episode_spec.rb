require 'spec_helper'

describe Episode do
  it "should return the enclosure for the feed" do
    episode = Factory.create(:episode)
    feed = Factory.create(:feed)
    enclosure = episode.enclosures.create(:feed => feed, :url => "http://google.com/alf.m4v")
    episode.enclosure(feed).should == enclosure
  end
end


# == Schema Information
#
# Table name: episodes
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  copy         :text
#  show_id      :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#  slug         :string(255)
#  published_at :datetime
#

