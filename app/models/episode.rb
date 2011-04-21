class Episode < ActiveRecord::Base
  belongs_to :show
  has_many :enclosures
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  
  def fix_formatting
    self.copy = ("<p>" + self.copy.gsub(/^<p>/, "").gsub(/<\/p>$/, "").split("\n\n").join("</p><p>").split("\n").join("<br/>") + "</p>")
    self.save
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

