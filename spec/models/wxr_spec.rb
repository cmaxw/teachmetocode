require 'spec_helper'

describe WXR do
  before(:each) do
    @show = Factory.create(:show)
    @wxr = File.open(File.dirname(__FILE__) + "/../fixtures/teachmetocode.wordpress.2011-04-19.xml", 'r').read
    @wxr_parser = WXR.new(@wxr, @show)
  end
  
  it "parses out categories" do
    Category.count.should == 0
    @wxr_parser.parse
    Category.count.should == 15
    clist = Category.all.map(&:name)
    clist.should include("Bash")
    clist.should include("CoffeeScript")
    clist.should include("CSS")
    clist.should include("Cucumber")
    clist.should include("Git")
    clist.should include("Grails")
    clist.should include("jQuery")
    clist.should include("MongoDB")
    clist.should include("Rack")
    clist.should include("RSpec")
    clist.should include("Ruby")
    clist.should include("Ruby on Rails")
    clist.should include("Testing")
    clist.should include("Uncategorized")
    clist.should include("Video Recording")
  end
  
  it "parses out categories" do
    Tag.count.should == 0
    @wxr_parser.parse
    Tag.count.should == 149
    tlist = Tag.all.map(&:name)
    tlist.should include("web")
    tlist.should include("token")
    tlist.should include("source code")
    tlist.should include("960 grid")
    tlist.should include("basic auth")
    tlist.should include("middleware")
  end
  
  it "parses out posts" do
    @show.episodes.count.should == 0
    @wxr_parser.parse
    @show.episodes.count.should == 66
    post = @show.episodes.first
    post.title.should == "Creating a Twitter Clone in Rails - Part 1"
    post.slug.should == "creating-a-twitter-clone-in-rails-part-1"
    post.copy.should == %Q{<p><object width="540" height="304"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=6459254&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=6459254&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="540" height="304"></embed></object><br/>In this series, I attempt to recreate a twitter style application called 'Flitter'.  In this installment, I show you how to create an authenticated system easily using existing tools.  I also show how to generate test data to simulate an active application.  Finally, you will learn how to set up self-referencial associations.<br/><a href="http://www.coderstore.info/CreatingaTwitterCloneinRails-Part1/CreatingaTwitterCloneinRails-Part1.m4v">Download</a> 280 MB<br/><a href="http://www.coderstore.info/CreatingaTwitterCloneinRails-Part1/CreatingaTwitterCloneinRails-Part1(iPhone).m4v">Download (iphone & ipod)</a> 86 MB</p>}
    post.published_at.getutc.should == Time.parse("2009-09-06 23:15:51 UTC")
  end
  
  it "adds categories to posts" do 
    @wxr_parser.parse
    post = @show.episodes.first
    categories = post.categories.map(&:name)
    categories.size.should == 1
    categories.should include("Ruby on Rails")
  end
  
  it "adds tags to posts" do 
    @wxr_parser.parse
    post = @show.episodes.first
    tags = post.tags.map(&:name)
    tags.size.should == 5
    tags.should include("authentication")
    tags.should include("gems")
    tags.should include("rails")
    tags.should include("ruby")
    tags.should include("twitter")
  end
  
  it "imports enclosures" do
    @wxr_parser.parse
    Feed.count.should == 2
    post = @show.episodes.last
    post.enclosures.size.should == 2
    @feed = Feed.find_by_name(@show.name)
    enclosure = post.enclosure(@feed)
    enclosure.url.should == "http://traffic.libsyn.com/tmtc/coffeescriptbasics.m4v"
    enclosure.size.should == "167956153"
    enclosure.mime.should == "video/x-m4v"
    
    @feed = Feed.find_by_name(@show.name + " - _iphone")
    enclosure = post.enclosure(@feed)
    enclosure.url.should == "http://traffic.libsyn.com/tmtc/coffeescriptbasicsiPhone.m4v"
    enclosure.size.should == "87313062"
    enclosure.mime.should == "video/x-m4v"    
  end
end