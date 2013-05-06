class Visit < ActiveRecord::Base
  attr_accessible :short_url_id, :created_at, :updated_at

  validates :short_url_id, :presence => true

  belongs_to :short_url
  has_one :long_url, :through => :short_url
  has_one :user, :through => :short_url
end
