require 'spec_helper'

describe "Feeds" do
  it "create a new feed" do
    visit new_feed_path
    page.fill_in "Name", :with => "Master Feed"
    page.fill_in "Slug", :with => "master"
    page.click_button "Save"
    page.should have_content("Feed was successfully created.")
    visit feeds_path
    page.should have_content("Master Feed")
  end

  it "edit a feed" do
    @feed = Factory.create(:feed)
    visit edit_feed_path(@feed)
    page.fill_in "Name", :with => "Grand Master Feed"
    page.fill_in "Slug", :with => "gmaster"
    page.click_button "Save"
    page.should have_content("Feed was successfully updated.")
    visit feeds_path
    page.should have_content("Grand Master Feed")
  end
  
  it "provide an RSS feed" do
    @feed = Factory.create(:feed)
    @show = Factory.create(:show)
    @episode = Factory.create(:episode, :show => @show)
    @feed.shows << @show
    visit "/feeds/#{@feed.slug}"
    page.should have_content(@episode.title)
    page.should have_content("/#{@show.slug}/#{@episode.slug}")
    page.should have_content("/feeds/#{@feed.slug}")
  end
end