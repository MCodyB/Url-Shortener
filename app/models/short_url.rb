class ShortUrl < ActiveRecord::Base
  attr_accessible :url, :user_id, :long_url_id, :comments

  belongs_to :user
  belongs_to :long_url

  validates :url, :uniqueness => true

  validates :long_url_id, :user_id, :presence => true

  has_many :visits
  has_many :taggings
  has_many :tag_topics, :through => :taggings


  def self.generate_short_url(long_url_id, user_id)
    str = "#{SecureRandom.urlsafe_base64(6)}"
    self.create!(url: str, user_id: user_id, long_url_id: long_url_id, comments: nil)
  end

end
