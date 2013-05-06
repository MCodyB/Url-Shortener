class ShortUrl < ActiveRecord::Base
  attr_accessible :url, :user_id, :long_url_id, :comments

  belongs_to :user
  belongs_to :long_url

  validates :long_url_id, :user_id, :presence => true

  has_many :visits
  has_many :taggings
  has_many :tag_topics, :through => :taggings
end
