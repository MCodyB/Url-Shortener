class AddTagging < ActiveRecord::Migration
  def up
    create_table :taggings do |t|
      t.integer :short_url_id
      t.integer :tag_topic_id

      t.timestamps
    end
  end

  def down
    drop_table :taggings
  end
end
