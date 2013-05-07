class Visit < ActiveRecord::Base
  attr_accessible :short_url_id

  validates :short_url_id, :presence => true

  belongs_to :short_url
  has_one :long_url, :through => :short_url
  has_one :user, :through => :short_url

  def self.long_url_count(url)
    LongUrl.where(url: url).first.visits.count
  end

  def self.distinct_url_visitors(url)
    LongUrl.where(url: url).first.users.count
  end
end
