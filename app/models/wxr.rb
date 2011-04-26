class WXR
  def initialize(body, show)
    @body = body
    @show = show
  end
  
  def parse
    @doc = Nokogiri::XML(@body)
    extract_categories
    extract_tags
    extract_posts
  end
  
  def extract_categories
    @doc.xpath("//wp:category//wp:cat_name").each do |category|
      category_name = category.children.first.text
      Category.create(:name => category_name) 
    end
  end
  
  def extract_tags
    @doc.xpath("//wp:tag//wp:tag_name").each do |tag|
      tag_name = tag.children.first.text
      Tag.create(:name => tag_name) 
    end    
  end
  
  def extract_posts
    @doc.xpath("//item").each do |post|
      if post.xpath(".//wp:post_type").text == "post"
        episode = create_episode(post)
        add_categories(post, episode)
        add_tags(post, episode)
        add_enclosures(post, episode)
      end
    end
  end
  
  def create_episode(post)
    post_title = post.xpath(".//title").text
    post_slug = post.xpath(".//link").text.split("/").compact.last
    post_pub_date = Time.parse(post.xpath(".//pubDate").text)
    post_content = post.xpath(".//content:encoded").children.first.text
    @show.episodes.create(:title => post_title, :slug => post_slug, :published_at => post_pub_date, :copy => post_content)
  end
  
  def add_categories(post, episode)
    post.xpath(".//category[@domain='category']").each do |category|
      cat_name = category.children.first.text
      cat = Category.find_or_create_by_name(cat_name)
      episode.categories << cat
    end
  end
  
  def add_tags(post, episode)
    post.xpath(".//category[@domain='post_tag']").each do |tag|
      tag_name = tag.children.first.text
      t = Tag.find_or_create_by_name(tag_name)
      episode.tags << t
    end
  end

  def add_enclosures(post, episode)
    post.xpath(".//wp:postmeta").each do |meta|
      key = meta.xpath(".//wp:meta_key").first.text
      if key.include?("enclosure")
        feed = create_feed(key)
        enclosure_meta = meta.xpath(".//wp:meta_value").first.text.split("\n")
        url = enclosure_meta[0]
        size = enclosure_meta[1]
        mime = enclosure_meta[2]
        episode.enclosures.create(:feed => feed, :url => url, :size => size, :mime => mime)
      end
    end
  end
  
  def create_feed(key)
    if key == "enclosure"
      feed = Feed.find_or_create_by_name(@show.name)
      feed.slug = @show.name.split(/\s/).join("-").gsub(/[^-a-zA-Z0-9]+/, "").gsub(/-+/, "-") if feed.new_record?
      feed.save
    else
      feed_name = @show.name + " - #{key.gsub(":enclosure", "")}"
      feed = Feed.find_or_create_by_name(feed_name)
      feed.slug = feed_name.split(/\s/).join("-").gsub(/[^-a-zA-Z0-9]+/, "").gsub(/-+/, "-") if feed.new_record?
      feed.save
    end
    feed
  end
end