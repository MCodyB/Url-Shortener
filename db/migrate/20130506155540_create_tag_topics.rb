class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|

      t.timestamps
    end
  end
end
