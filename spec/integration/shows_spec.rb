require 'spec_helper'

describe "Shows" do
  it "#show should dislay the show's name" do
    @show = Factory.create(:show)
    visit "/#{@show.slug}"
    page.should have_content(@show.name)
  end
  
  it "creation" do
    login_admin
    visit "/shows/new"
    fill_in "show_name", :with => "Teach Me To Code > Screencasts"
    fill_in "show_slug", :with => "screencasts"
    fill_in "show_description", :with => "Teach Me To Code Screencasts are awesome tutorials."
    attach_file "show_image", File.dirname(__FILE__) + "/../fixtures/Icon_128x128.gif"
    click_button "Save"
    visit "/screencasts"
    page.should have_content("Teach Me To Code > Screencasts")
  end
  
  it "list" do
    Factory.create(:show, :name => "Some Dumb Show", :description => "I'm a sad little boy.")
    Factory.create(:show, :name => "Another Dumb Show", :description => "I'm a sad little girl.")
    visit "/shows"
    page.should have_content("Some Dumb Show")
    page.should have_content("I'm a sad little boy")
    page.should have_content("I'm a sad little girl")
    page.should have_content("Another Dumb Show")
    page.should_not have_content("Edit")
    page.should_not have_content("Delete")
  end
end