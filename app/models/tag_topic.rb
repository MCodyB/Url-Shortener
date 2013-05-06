class TagTopic < ActiveRecord::Base
  attr_accessible :tag

  validates :tag, :presence => true

  has_many :taggings
  has_many :short_urls, :through => :taggings
  has_many :long_urls, :through => :short_urls
end
