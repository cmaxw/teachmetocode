require 'spec_helper'

describe "Shows" do
  it "#show should dislay the show's name" do
    @show = Factory.create(:show)
    visit "/#{@show.slug}"
    page.should have_content(@show.name)
  end
end