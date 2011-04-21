require 'spec_helper'

describe "Episodes" do
  it "can be created" do
    login_admin
    @show = Factory.create(:show)
    visit new_show_episode_path(@show)
    page.should have_content(@show.name)
    fill_in :title, :with => "TMTC 55 The Ugly Bug"
  end
  
  it "#import accepts a WXR file and imports episodes" do
    login_admin
    @show = Factory.create(:show)
    visit import_show_episodes_path(@show)
    page.should have_content(@show.name)
    path = File.join(::Rails.root, "spec", "fixtures", "teachmetocode.wordpress.2011-04-19.xml")
    attach_file("wxr_file", path)
    click_button("Import")
    visit "/#{@show.slug}"
    page.should have_content("CoffeeScript Basics")
  end
end