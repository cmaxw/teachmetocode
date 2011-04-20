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
end