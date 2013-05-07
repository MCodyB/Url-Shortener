class User < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :short_urls

  validates :email, :uniqueness => true
  validates :name, :uniqueness => true

  validates :name, :email, :presence => true

  has_many :long_urls, :through => :short_urls
  has_many :visits, :through => :short_urls

  def self.create_new_user(name, email)
    User.create(name: name, email: email)
  end

  def submit_url(long_url)
    if LongUrl.where(url: long_url).empty?
      long_url = LongUrl.create!(:url => long_url)
    else
      long_url = LongUrl.where(url: long_url).first
    end
    a = ShortUrl.generate_short_url(long_url.id, self.id)
    a.url
  end

  def attach_comment(short_url, comments)
    short = ShortUrl.where(:url => short_url).first
    short.comments = comments
    short.save!
  end

  def add_tag(short_url, tag)
    short = ShortUrl.where(:url => short_url).first
    tag = TagTopic.where(:tag => tag).first
    Tagging.create!(short_url_id: short.id, tag_topic_id: tag.id)
  end

  def launch_website(short_url)
    short = ShortUrl.where(:url => short_url).first
    link = short.long_url.url
    puts short.comments if short.comments
    Launchy.open(link)
    create_visit!(short.id)
  end

  def create_visit!(id)
    Visit.create!(:short_url_id => id)
  end

  def submitted_urls
    self.long_urls
  end

  def tags
    TagTopic.pluck(:tag)
  end

  # def popular_links(tag)
 #    LongUrl.select('url').group(tag).maximum(tag)
 #  end

end
