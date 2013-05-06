class User < ActiveRecord::Base
  attr_accessible :name, :email#, :created_at, :updated_at

  has_many :short_urls

  validates :email, :uniqueness => true
  validates :name, :uniqueness => true

  validates :name, :email, :presence => true

  has_many :long_urls, :through => :short_urls
  has_many :visits, :through => :short_urls
end
