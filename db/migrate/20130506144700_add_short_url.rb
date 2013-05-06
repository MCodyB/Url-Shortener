class AddShortUrl < ActiveRecord::Migration
  def up
    create_table :short_urls do |t|
      t.string :url
      t.integer :user_id
      t.integer :long_url_id

      t.timestamps
    end
  end

  def down
    drop_table :short_urls
  end
end
