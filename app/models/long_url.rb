class LongUrl < ActiveRecord::Base
  attr_accessible :url

  validates :url, :presence => true
  validates :url, :uniqueness => true

  has_many :short_urls
  has_many :visits, :through => :short_urls
  has_many :tag_topics, :through => :short_urls
  has_many :users, :through => :short_urls
end
