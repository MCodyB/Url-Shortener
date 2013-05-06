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
    long_url = LongUrl.create(long_url)
    a = ShortUrl.generate_short_url(long_url.id, self.id)
    a.url
  end

  def launch_website_from_s_url(short_url)
    link = ShortUrl.where(:url => short_url).long_url.url
    Launchy.open(link)
  end

end
