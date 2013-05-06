class AddLongUrl < ActiveRecord::Migration
  def up
    create_table :long_urls do |t|
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :long_urls
  end
end
