class AddCommentsToShortUrl < ActiveRecord::Migration
  def change
    add_column :short_urls, :comments, :text
  end
end
