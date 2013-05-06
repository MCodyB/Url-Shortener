class Tagging < ActiveRecord::Base
  attr_accessible :short_url_id, :tag_topic_id

  validates :short_url_id, :tag_topic_id, :presence => true

  has_many :short_urls
  has_many :tag_topics
end
