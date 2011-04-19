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
        post_title = post.xpath(".//title").text
        post_slug = post.xpath(".//link").text.split("/").compact.last
        post_pub_date = Time.parse(post.xpath(".//pubDate").text)
        post_content = post.xpath(".//content:encoded").children.first.text
        @show.episodes.create(:title => post_title, :slug => post_slug, :published_at => post_pub_date, :copy => post_content) 
      end
    end
  end
end